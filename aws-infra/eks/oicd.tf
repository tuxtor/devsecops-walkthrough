data "http" "aws-lb-controller-policy" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"
}

data "tls_certificate" "eks_cluster_tls_certificate" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks_cluster_oidc_provider" {
  url             = data.tls_certificate.eks_cluster_tls_certificate.url
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks_cluster_tls_certificate.certificates[0].sha1_fingerprint]
}

resource "aws_iam_policy" "aws_load_balancer_controller_iam_policy" {
  name        = "AWSLoadBalancerControllerIAMPolicy"
  policy      = data.http.aws-lb-controller-policy.response_body
  description = "Load Balancer Controller add-on for EKS"
}

data "aws_iam_policy_document" "eks_cluster_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.eks_cluster_oidc_provider.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_cluster_oidc_provider.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-load-balancer-controller"]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_cluster_oidc_provider.url, "https://", "")}:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "aws_lb_controller_service_account_role" {
  name               = "eks-aws-load-balancer-controller-sa-role"
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_assume_role_policy_document.json
}

// Attach the OIDC policy to the IAM role
resource "aws_iam_role_policy_attachment" "eks-cluster-attachment" {
  policy_arn = aws_iam_policy.aws_load_balancer_controller_iam_policy.arn
  role       = aws_iam_role.aws_lb_controller_service_account_role.name
}
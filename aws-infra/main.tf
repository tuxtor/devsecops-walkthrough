locals {
  project_name = "tofu"
  global_tags = {
    Project = local.project_name
  }
  bootstraping = true
}

module "network" {
  source               = "./network"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  name                 = "vorozco-vpc"
  cluster-name         = var.aws_cluster_name # Do not depend on eks value to avoid circular dependency
  tags                 = local.global_tags
}

module "eks" {
  source             = "./eks"
  cluster_name       = var.aws_cluster_name
  eks_version        = "1.33"
  private_subnet_ids = module.network.private_subnet_ids

  tags = local.global_tags
}

module "helm" {
  source                      = "./helm"
  cluster_certificate         = module.eks.kubeconfig-certificate-authority-data
  cluster_endpoint            = module.eks.endpoint
  cluster_name                = module.eks.name
  alb_service_account_iam_arn = module.eks.alb_service_account_iam_arn
  region                      = var.aws_region
  vpc_id                      = module.network.vpc_id
  acm_certificate_arn         = module.route53.acm_certificate_arn
  infra_bootstrap             = var.infra_bootstrap
}

module "ecr-quarkus" {
  source          = "./ecr"
  repository_name = "quarkus-cloud-native-workload"
  scan_on_push    = false
  tags            = local.global_tags
}

module "route53" {
  source          = "./route53"
  subdomain       = var.aws_hosted_zone_subdomain
  tags            = local.global_tags
  alb_dns_name    = module.helm.alb_dns_name
  alb_zone_id     = module.helm.alb_zone_id
  infra_bootstrap = var.infra_bootstrap
}
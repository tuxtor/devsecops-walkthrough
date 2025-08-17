resource "aws_security_group" "ec2_sg" {
  name        = "${var.ec2_name}-sg"
  description = "Allow SSH, HTTP, and HTTPS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "ssm_role" {
  name = "ec2-ssm-role-${var.ec2_name}"
  assume_role_policy = data.aws_iam_policy_document.ssm_assume_role.json
}

data "aws_iam_policy_document" "ssm_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ssm_managed_instance" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ec2-ssm-profile-${var.ec2_name}"
  role = aws_iam_role.ssm_role.name
}

resource "aws_instance" "ec2_host" {
  instance_type   = var.instance_type
  ami             = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.ec2_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = var.ec2_name
  }
  key_name = data.aws_key_pair.ec2_tofu_keypair.key_name
}

data "aws_key_pair" "ec2_tofu_keypair"  {
  key_name = "vorozco-opentofu"
}
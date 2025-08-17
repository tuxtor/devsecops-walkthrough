locals {
  project_name = "tofu"
  global_tags = {
    Project = local.project_name
  }
}

module "network" {
  source               = "./network"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  name                 = "vorozco-vpc"

  tags = local.global_tags
}

module "eks" {
  source             = "./eks"
  cluster_name       = var.aws_cluster_name
  eks_version        = "1.33"
  private_subnet_ids = module.network.private_subnet_ids

  tags = local.global_tags
}

module "helm" {
  source = "./helm"

  cluster_certificate = module.eks.kubeconfig-certificate-authority-data
  cluster_endpoint    = module.eks.endpoint
  cluster_name        = module.eks.name
}

module "ecr-quarkus-cloud-native-workload" {
  source          = "./ecr"
  repository_name = "quarkus-cloud-native-workload"
  scan_on_push    = false
  tags            = local.global_tags
}

module "route53" {
  source    = "./route53"
  subdomain = var.aws_hosted_zone_subdomain

  tags = local.global_tags
}
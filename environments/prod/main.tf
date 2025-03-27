module "vpc" {
  source         = "../../modules/vpc"
  cidr_block     = "10.1.0.0/16"
  public_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  environment    = var.environment
}

module "kms" {
  source = "../../modules/kms"
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}

module "eks" {
  source           = "../../modules/eks"
  subnet_ids       = module.vpc.public_subnet_ids
  cluster_role_arn = module.iam.eks_cluster_role_arn
  environment      = var.environment
}
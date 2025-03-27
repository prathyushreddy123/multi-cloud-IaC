resource "aws_eks_cluster" "gitops" {
    name = "${var.environment}-eks-cluster"
    role_arn = var.cluster_role_arn
    
    vpc_config {
      subnet_ids = var.subnet_ids
    }
    tags = {
        Environment = var.environment
    }
    
    }

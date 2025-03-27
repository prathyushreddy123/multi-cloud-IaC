resource "aws_kms_key" "terraform" {
  description         = "KMS key for Terraform secrets encryption"
  enable_key_rotation = true
}
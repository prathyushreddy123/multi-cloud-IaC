# Dynamic backend using variables

terraform {
  backend "s3" {
    bucket = var.state_bucket
    key = "state/${var.environment}/terraform.tfstate"
    region = var.region
    encrypt = true
    dynamodb_table = var.state_lock_table
  }
}
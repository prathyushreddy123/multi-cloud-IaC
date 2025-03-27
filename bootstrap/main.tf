provider "aws" {
    region = var.region
  
}

resource "aws_s3_bucket" "tf_state" {
    bucket = var.state_bucket
    force_destroy = true

    tags = {
        Name = "Terraform State Bucket"
    }
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.tf_state.id

    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = var.state_lock_table
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}
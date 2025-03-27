variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "state_bucket" {
  type        = string
  description = "S3 bucket name for Terraform state"
}

variable "state_lock_table" {
  type        = string
  description = "DynamoDB table name for Terraform locking"
}
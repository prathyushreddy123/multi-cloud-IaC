variable "region" {
    description = "AWS region"
    type = string
    default = "us-east-1"
}

variable "environment" {
    description = "Deployment environment (dev, prod)"
    type = string
}

variable "state_bucket" {
    description = "S3 bucket for terraform state"
    type = string
}

variable "state_lock_table" {
    description = "DynamoDB table for state locking"
    type = string
}

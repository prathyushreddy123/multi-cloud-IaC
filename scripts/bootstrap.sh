#!/bin/bash

# Set values here or export them before running the script
ENVIRONMENT=${1:-dev}
REGION=${2:-us-east-1}
BUCKET_NAME="multi-cloud-terraform-state"
LOCK_TABLE_NAME="terraform-locks"

echo "Bootstrapping Terraform backend resources..."
echo "Region: $REGION"
echo "S3 Bucket: $BUCKET_NAME"
echo "DynamoDB Table: $LOCK_TABLE_NAME"

# Navigate to the bootstrap folder
cd "$(dirname "$0")/../bootstrap" || exit 1

# Create a temporary tfvars file
cat <<EOF > terraform.auto.tfvars
state_bucket      = "$BUCKET_NAME"
state_lock_table  = "$LOCK_TABLE_NAME"
region            = "$REGION"
EOF

# Initialize and apply Terraform
terraform init
terraform apply -auto-approve

# Cleanup temporary file
rm terraform.auto.tfvars

echo "Bootstrap complete for environment: $ENVIRONMENT"

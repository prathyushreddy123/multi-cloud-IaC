#!/bin/bash

# Usage: bash scripts/init.sh [environment] [region]
# Example: bash scripts/init.sh dev us-east-1

ENVIRONMENT=${1:-dev}
REGION=${2:-us-east-1}
STATE_BUCKET="multi-cloud-terraform-state"
STATE_TABLE="terraform-locks"
STATE_KEY="state/${ENVIRONMENT}/terraform.tfstate"

echo "Initializing Terraform for environment: $ENVIRONMENT"
echo "Region: $REGION"
echo "S3 Bucket: $STATE_BUCKET"
echo "DynamoDB Table: $STATE_TABLE"
echo "State Key: $STATE_KEY"

cd "envs/$ENVIRONMENT" || { echo "Directory envs/$ENVIRONMENT not found."; exit 1; }

terraform init \
  -backend-config="bucket=$STATE_BUCKET" \
  -backend-config="key=$STATE_KEY" \
  -backend-config="region=$REGION" \
  -backend-config="dynamodb_table=$STATE_TABLE" \
  -backend-config="encrypt=true"

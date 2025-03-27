region          = "us-east-1"
environment     = "prod"
state_bucket    = "multi-cloud-terraform-state" ## This is not needed unless you calling in init.sh
state_lock_table = "terraform-locks" ## This is not needed unless you calling in init.sh
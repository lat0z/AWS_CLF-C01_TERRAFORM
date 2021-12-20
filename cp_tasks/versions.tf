terraform {
  required_version = ">= 1.1.2"
  backend "s3" {
    bucket               = "${var.backend_bucket}"
    workspace_key_prefix = "environments"
    key                  = "state"
    region               = "${var.region}"
    dynamodb_table       = "${backend_table}"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.69"
    }
  }
}
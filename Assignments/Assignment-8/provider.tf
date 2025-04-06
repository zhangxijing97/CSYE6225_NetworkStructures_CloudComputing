##############################################
# Provider Configuration
##############################################
provider "aws" {
  # Using the IAM role from your AWS Academy Lab means you typically
  # don't need an access_key or secret_key here.
  # Just ensure the instance has the correct IAM Role (LabRole).
  region = var.aws_region
}
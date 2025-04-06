##############################################
# Variables
##############################################

variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_username" {
  description = "Username for the RDS instance."
  type        = string
  default     = "postgres_user"
}

variable "db_password" {
  description = "Password for the RDS instance."
  type        = string
  default     = "ChangeMe123!"
  sensitive   = true
}

variable "db_name" {
  description = "Database name."
  type        = string
  default     = "webapp_db"
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "web-server-instance"
}

variable "username" {
  description = "Your name for the webpage"
  type        = string
}
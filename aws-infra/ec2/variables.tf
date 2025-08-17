variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_name" {
    description = "Name tag for the EC2 instance"
    type        = string
    default     = "ec2-instance"
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}


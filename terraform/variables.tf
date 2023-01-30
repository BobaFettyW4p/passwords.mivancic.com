variable "region" {
  type        = string
  description = "AWS region name"
  default     = "us-east-2"
}
variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}
variable "instance_key" {}
variable "ami" {
  type        = string
  description = "AMI ID"
}
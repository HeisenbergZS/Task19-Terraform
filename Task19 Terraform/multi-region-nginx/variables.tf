# Region for first EC2 instance
variable "aws_region_1" {
  default = "us-east-1"
}

# Region for second EC2 instance
variable "aws_region_2" {
  default = "us-west-2"
}

# Instance type for both EC2 instances
variable "instance_type" {
  default = "t2.micro"
}

# Amazon Linux 2 AMI for us-east-1 (Region 1)
variable "ami_id_region1" {
  default = "ami-0953476d60561c955" # us-east-1
}

# Amazon Linux 2 AMI for us-west-2 (Region 2)
variable "ami_id_region2" {
  default = "ami-04999cd8f2624f834" # us-west-2
}

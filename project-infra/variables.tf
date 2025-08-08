variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0f918f7e67a3323f0"  # Replace with your actual AMI ID
}



variable "ansible_repo_url" {
  description = "Git repo URL for ansible-pull"
  type        = string
  default     = "https://github.com/akashjaiswal36/aws-ec2-lb-terraform-ansible-project.git"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
  default     = "aws-key"
}
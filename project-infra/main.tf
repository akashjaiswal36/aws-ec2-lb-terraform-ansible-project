provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-020cba7c55df1f615" # Ubuntu AMI
  instance_type = "t2.micro"
  key_name      = "aws-key.pem"

  user_data = <<-EOF
              #!/bin/bash
              apt update && apt install -y ansible git
              ansible-pull -U https://github.com/akashjaiswal36/aws-ec2-lb-terraform-ansible-project.git ansible/playbooks/webserver.yml
              EOF

  vpc_security_group_ids = [aws_security_group.web_sg.id]
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
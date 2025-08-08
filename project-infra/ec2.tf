resource "aws_launch_template" "web_template" {
  name_prefix   = "web-server"
  image_id      = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"

  user_data = base64encode(templatefile("${path.module}/userdata.tpl", {
    ansible_pull_url = "https://github.com/akashjaiswal36/aws-ec2-lb-terraform-ansible-project.git"
  }))

  iam_instance_profile {
    name = aws_iam_instance_profile.web_profile.name
  }

  security_group_names = ["web-sg"]
}
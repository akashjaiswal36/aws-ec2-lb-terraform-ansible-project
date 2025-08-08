resource "aws_iam_role" "web_role" {
  name = "web-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_instance_profile" "web_profile" {
  name = "web-profile"
  role = aws_iam_role.web_role.name
}
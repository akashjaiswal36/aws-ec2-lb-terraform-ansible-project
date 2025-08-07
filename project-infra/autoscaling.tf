resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 2
  min_size             = 1
  launch_template {
    id      = aws_launch_template.web_template.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.web_tg.arn]
  vpc_zone_identifier = var.public_subnets
}
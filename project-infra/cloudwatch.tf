resource "aws_cloudwatch_log_group" "web_logs" {
  name              = "/aws/web-app"
  retention_in_days = 7
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "HighCPUAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when CPU exceeds 80%"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_asg.name
  }
}
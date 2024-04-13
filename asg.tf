# Creates an Auto Scaling Group
resource "aws_autoscaling_group" "tf-ASG" {
  name                      = "tf-ASG"
  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  vpc_zone_identifier       = [aws_subnet.tf-subnet-1.id, aws_subnet.tf-subnet-2.id]

  launch_template {
    id      = aws_launch_template.tf-LT.id
    version = "$Latest"
  }
}

# Attaches the target group to the Auto Scaling Group
resource "aws_autoscaling_attachment" "tf-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.tf-ASG.name
  lb_target_group_arn    = aws_lb_target_group.tf-TG.arn
}

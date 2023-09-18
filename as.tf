# Create autoscaling group for presentation tier
resource "aws_autoscaling_group" "presentation_tier" {
  name                      = "ASG-Presentation-Tier"
  max_size                  = 4
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  vpc_zone_identifier       = aws_subnet.public_subnets.*.id

  launch_template {
    id      = aws_launch_template.presentation_tier.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }

  tag {
    key                 = "Name"
    value               = "nginx_app"
    propagate_at_launch = true
  }
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "presentation_tier" {
  autoscaling_group_name = aws_autoscaling_group.presentation_tier.id
  lb_target_group_arn    = aws_lb_target_group.front_end.arn
}

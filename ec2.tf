# Get the current caller identity
#data "aws_caller_identity" "current" {}



# Create a launch template for presentation tier
resource "aws_launch_template" "presentation_tier" {
  name = "presentation_tier"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 8
    }
  }

  key_name      = "test-server"
  instance_type = "t2.micro"
  image_id      = "ami-0bcb0e895c478d2a9"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.presentation_tier.id]
  }

  user_data = base64encode(templatefile("./user-data/user-data-docker.sh", {
    application_load_balancer = aws_lb.front_end.dns_name
  }))

}

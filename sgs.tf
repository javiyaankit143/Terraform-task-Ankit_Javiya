resource "aws_security_group" "presentation_tier" {
  name        = "presentation_tier_connection"
  description = "Allow HTTP requests"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "HTTP from anywhere"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "SSH from anywhere"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  #  security_groups = [aws_security_group.alb_presentation_tier.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "presentation_tier_sg"
  }
}

resource "aws_security_group" "alb_presentation_tier" {
  name        = "alb_presentation_tier_connection"
  description = "Allow HTTP requests"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "HTTP from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb_presentation_tier_sg"
  }
}


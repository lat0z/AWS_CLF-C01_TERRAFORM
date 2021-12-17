resource "aws_security_group" "custom" {
  name        = "my_new_security_group"
  description = "Custom Security group for my tests "

  #  ingress {
  #    description      = "ssh"
  #    from_port        = 22
  #    to_port          = 22
  #    protocol         = "tcp"
  #    cidr_blocks      = ["187.190.197.225/32"]
  #  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "testing"
  }
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["187.190.197.225/32"]
  security_group_id = aws_security_group.custom.id
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.custom.id
}
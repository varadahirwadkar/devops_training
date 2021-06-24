resource "aws_security_group" "webSG" {
  name        = var.sg_name
  description = "Allow ssh  inbound traffic"

  ingress {
    description = "For SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "For HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
}

output "SG_ID"{
  value = aws_security_group.webSG.id
}
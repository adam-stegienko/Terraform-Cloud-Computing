resource "aws_security_group" "adam-sg" {
  name        = "adam-server-sg"
  description = "Security Group for Adam Server"
  vpc_id      = aws_vpc.adam-vpc.id

  ingress {
    description = "Inbound connection"
    from_port   = var.def_port
    to_port     = var.def_port
    protocol    = var.protocols[1]
    cidr_blocks = [var.ipv4_range[1]]
  }

  ingress {
    description = "Inbound connection"
    from_port   = 22
    to_port     = 22
    protocol    = var.protocols[1]
    cidr_blocks = [var.ipv4_range[1]]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.ipv4_range[1]]
    ipv6_cidr_blocks = ["::/0"]
  }
}
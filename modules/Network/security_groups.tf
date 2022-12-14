resource "aws_security_group" "adam-sg" {
  name        = var.lb_security_group["name"]
  description = var.lb_security_group["description"]
  vpc_id      = aws_vpc.adam-vpc.id

  tags = var.adam_tags

  ingress {
    description = var.ingress_one["description"]
    from_port   = var.ingress_one["from_port"]
    to_port     = var.ingress_one["to_port"]
    protocol    = var.ingress_one["protocol"]
    cidr_blocks = [var.ingress_one["cidr_blocks"]]
  }

  ingress {
    description = var.ingress_two["description"]
    from_port   = var.ingress_two["from_port"]
    to_port     = var.ingress_two["to_port"]
    protocol    = var.ingress_two["protocol"]
    cidr_blocks = [var.ingress_two["cidr_blocks"]]
  }

  egress {
    description      = var.egress_all["description"]
    from_port        = var.egress_all["from_port"]
    to_port          = var.egress_all["to_port"]
    protocol         = var.egress_all["protocol"]
    cidr_blocks      = [var.egress_all["cidr_blocks"]]
    ipv6_cidr_blocks = [var.egress_all["ipv6_cidr_blocks"]]
  }
}
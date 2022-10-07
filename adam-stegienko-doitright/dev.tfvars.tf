variable "ec2_data" {
  type = map(any)
  default = {
    name          = "web_server"
    ami           = "ami-07a512ad10d82b9e2"
    instance_type = "t2.micro"
  }
}

variable "no_of_subnets" {
  description = ""
}

variable "init_file" {
  type    = string
  default = "./docker-init.sh"
}

variable "cidr_block" {
  type    = list(string)
  default = ["10.10.0.0/28", "10.10.0.192/28", ]
}

variable "availability_zone" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "adam_tags" {
  type = map(string)
  default = {
    bootcamp   = "poland1"
    created_by = "Adam Stegienko"
    Name       = "ADAM"
  }
}

variable "health_check" {
  type = map(any)
  default = {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}

variable "alb_target" {
  type = map(any)
  default = {
    name     = "adam-target"
    port     = 80
    protocol = "HTTP"
  }
}

variable "alb_balancer" {
  type = map(any)
  default = {
    name               = "adam-lb"
    internal           = false
    load_balancer_type = "application"
    ip_address_type    = "ipv4"
  }
}

variable "alb_listener" {
  type = map(any)
  default = {
    port     = 80
    protocol = "HTTP"
  }
}

variable "lb_listener_default_action" {
  type    = string
  default = "forward"
}

variable "lb_security_group" {
  type = map(any)
  default = {
    name        = "adam-server-sg"
    description = "Security Group for Adam Server"
  }
}

variable "ingress_one" {
  type = map(any)
  default = {
    description = "Inbound connection"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = "0.0.0.0/0"
  }
}

variable "ingress_two" {
  type = map(any)
  default = {
    description = "Inbound connection"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = "0.0.0.0/0"
  }
}

variable "egress_all" {
  type = map(any)
  default = {
    description      = "Outbound connection"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = "0.0.0.0/0"
    ipv6_cidr_blocks = "::/0"
  }
}

variable "vpc_ip_range" {
  type    = string
  default = "10.10.0.0/24"
}

variable "route_table_ip_range" {
  type    = string
  default = "0.0.0.0/0"
}

variable "lb_attachment_port" {
  type    = number
  default = 80
}
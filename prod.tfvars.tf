variable "ec2_data" {
  type = map(any)
  default = {
    name          = "web_server"
    ami           = "ami-07a512ad10d82b9e2"
    instance_type = "t2.micro"
  }
  description = "AWS EC2 instance(s) data"
}

variable "no_of_subnets" {
  description = "Number of subnets/instaces that are going to be created in a terraform apply job"
}

variable "init_file" {
  type    = string
  default = "./docker-init.sh"
  description = "Initial set-up file that is running a docker container; stored in user_data.txt file inside EC2 instance"
}

variable "cidr_block" {
  type    = list(string)
  default = ["10.10.0.0/28", "10.10.0.192/28", ]
  description = "CIDR blocks for subnets creation"
}

variable "availability_zone" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
  description = "Availability zones for subnets creation"
}

variable "adam_tags" {
  type = map(string)
  default = {
    bootcamp   = "poland1"
    created_by = "Adam Stegienko"
    Name       = "Adam Stegienko_PROD"
  }
  description = "Default tags for production workspace"
}

variable "health_check" {
  type = map(any)
  default = {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
  description = "Health check configuration"
}

variable "alb_target" {
  type = map(any)
  default = {
    name     = "adam-target"
    port     = 80
    protocol = "HTTP"
  }
  description = "Application Load Balancer's target group configuration"
}

variable "alb_balancer" {
  type = map(any)
  default = {
    name               = "adam-lb"
    internal           = false
    load_balancer_type = "application"
    ip_address_type    = "ipv4"
  }
  description = "Application Load Balancer's configuration"
}

variable "alb_listener" {
  type = map(any)
  default = {
    port     = 80
    protocol = "HTTP"
  }
  description = "Application Load Balancer listener's configuration"
}

variable "lb_listener_default_action" {
  type    = string
  default = "forward"
  description = "Load Balancer's listener default action configuration"
}

variable "lb_security_group" {
  type = map(any)
  default = {
    name        = "adam-server-sg"
    description = "Security Group for Load Balancer"
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
  description = "Ingress one configuration"
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
  description = "Ingress two configuration"
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
  description = "Egress universal configuration"
}

variable "vpc_ip_range" {
  type    = string
  default = "10.10.0.0/24"
  description = "IP range for Virtual Private Cloud"
}

variable "route_table_ip_range" {
  type    = string
  default = "0.0.0.0/0"
  description = "IP range for Route Table"
}

variable "lb_attachment_port" {
  type    = number
  default = 80
  description = "Load Balancer's attachment port"
}
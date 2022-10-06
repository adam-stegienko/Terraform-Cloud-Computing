variable "ec2_data" {
  type = map(any)
}

variable "init_file" {
  type = string
}

variable "cidr_block" {
  type = list(string)
}

variable "availability_zone" {
  type = list(string)
}

variable "adam_tags" {
  type = map(string)
}

variable "health_check" {
  type = map(any)
}

variable "alb_target" {
  type = map(any)
}

variable "alb_balancer" {
  type = map(any)
}

variable "alb_listener" {
  type = map(any)
}

variable "lb_listener_default_action" {
  type = string
}

variable "lb_security_group" {
  type = map(any)
}

variable "ingress_one" {
  type = map(any)
}

variable "ingress_two" {
  type = map(any)
}

variable "egress_all" {
  type = map(any)
}

variable "vpc_ip_range" {
  type = string
}

variable "route_table_ip_range" {
  type = string
}

variable "no_of_subnets" {
  description = ""
}

variable "lb_attachment_port" {
  type = number
}
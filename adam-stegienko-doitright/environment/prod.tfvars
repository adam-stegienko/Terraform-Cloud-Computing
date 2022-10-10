ec2_data = {
  name          = "web_server"
  ami           = "ami-0caef02b518350c8b"
  instance_type = "t2.micro"

}
init_file         = "./docker-init.sh"
cidr_block        = ["10.10.0.0/28", "10.10.0.192/28"]
availability_zone = ["eu-central-1a", "eu-central-1b"]
adam_tags = {
  bootcamp   = "poland1"
  created_by = "Adam Stegienko"
  Name       = "Adam Stegienko_PROD"
}
health_check = {
  port     = 80
  protocol = "HTTP"
  timeout  = 5
  interval = 10
}
alb_target = {
  name     = "adam-target"
  port     = 80
  protocol = "HTTP"
}
alb_balancer = {
  name               = "adam-lb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
}
alb_listener = {
  port     = 80
  protocol = "HTTP"
}
lb_listener_default_action = "forward"
lb_security_group = {
  name        = "adam-server-sg"
  description = "Security Group for Load Balancer"
}
ingress_one = {
  description = "Inbound connection"
  from_port   = 80
  to_port     = 80
  protocol    = "TCP"
  cidr_blocks = "0.0.0.0/0"
}
ingress_two = {
  description = "Inbound connection"
  from_port   = 22
  to_port     = 22
  protocol    = "TCP"
  cidr_blocks = "0.0.0.0/0"
}

egress_all = {
  description      = "Outbound connection"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = "0.0.0.0/0"
  ipv6_cidr_blocks = "::/0"
}
vpc_ip_range         = "10.10.0.0/24"
route_table_ip_range = "0.0.0.0/0"
lb_attachment_port   = 80
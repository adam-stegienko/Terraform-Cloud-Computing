resource "aws_lb_target_group" "adam-target" {
  name     = var.alb_target["name"]
  port     = var.alb_target["port"]
  protocol = var.alb_target["protocol"]
  vpc_id   = aws_vpc.adam-vpc.id

  health_check {
    port     = var.health_check["port"]
    protocol = var.health_check["protocol"]
    timeout  = var.health_check["timeout"]
    interval = var.health_check["interval"]
  }

  lifecycle {
    create_before_destroy = "true"
  }
}

resource "aws_lb" "adam-lb" {
  name               = var.alb_balancer["name"]
  internal           = var.alb_balancer["internal"]
  load_balancer_type = var.alb_balancer["load_balancer_type"]
  ip_address_type    = var.alb_balancer["ip_address_type"]
  security_groups    = [aws_security_group.adam-sg.id]
  subnets            = aws_subnet.adam-terra-sub[*].id
}

resource "aws_lb_listener" "adam-listener" {
  load_balancer_arn = aws_lb.adam-lb.arn
  port              = var.alb_listener["port"]
  protocol          = var.alb_listener["protocol"]

  default_action {
    target_group_arn = aws_lb_target_group.adam-target.arn
    type             = var.lb_listener_default_action
  }
}

resource "aws_lb_target_group_attachment" "adam-lb-attach" {
  count = length(var.cidr_block)

  target_group_arn = aws_lb_target_group.adam-target.arn
  target_id        = element(aws_instance.web_server.*.id, count.index)
  port             = var.lb_attachment_port
}
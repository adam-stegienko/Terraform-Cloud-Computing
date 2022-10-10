resource "aws_lb_target_group" "adam-target" {
  count = var.no_of_subnets > 1 ? 1 : 0

  name     = var.alb_target["name"]
  port     = var.alb_target["port"]
  protocol = var.alb_target["protocol"]
  vpc_id   = data.aws_vpc.adam-vpc.id

  tags = var.adam_tags

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
  count = var.no_of_subnets > 1 ? 1 : 0

  name               = var.alb_balancer["name"]
  internal           = var.alb_balancer["internal"]
  load_balancer_type = var.alb_balancer["load_balancer_type"]
  ip_address_type    = var.alb_balancer["ip_address_type"]
  security_groups    = [data.aws_security_group.adam-sg.id]
  subnets            = data.aws_subnet.adam-terra-sub[*].id

  tags = var.adam_tags
}

resource "aws_lb_listener" "adam-listener" {
  count = var.no_of_subnets > 1 ? 1 : 0

  load_balancer_arn = aws_lb.adam-lb[count.index].arn
  port              = var.alb_listener["port"]
  protocol          = var.alb_listener["protocol"]

  tags = var.adam_tags

  default_action {
    target_group_arn = aws_lb_target_group.adam-target[count.index].arn
    type             = var.lb_listener_default_action
  }
}

resource "aws_lb_target_group_attachment" "adam-lb-attach" {
  count = var.no_of_subnets > 1 ? var.no_of_subnets : 0

  target_group_arn = aws_lb_target_group.adam-target[0].arn
  target_id        = element(aws_instance.web_server.*.id, count.index)
  port             = var.lb_attachment_port
}
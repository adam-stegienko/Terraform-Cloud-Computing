resource "aws_lb_target_group" "adam-target" {
  name     = "adam-target"
  port     = var.def_port
  protocol = var.protocols[0]
  vpc_id   = aws_vpc.adam-vpc.id

  health_check {
    port     = var.def_port
    protocol = var.protocols[0]
    timeout  = 5
    interval = 10
  }

  lifecycle { create_before_destroy = true }
}

resource "aws_lb" "adam-lb" {
  depends_on = [aws_subnet.adam-terra-sub]

  name               = "adam-lb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  security_groups    = [aws_security_group.adam-sg.id]
  subnets            = [aws_subnet.adam-terra-sub[0].id, aws_subnet.adam-terra-sub[1].id]
}

resource "aws_lb_listener" "adam-listener" {
  load_balancer_arn = aws_lb.adam-lb.arn
  port              = var.def_port
  protocol          = var.protocols[0]

  default_action {
    target_group_arn = aws_lb_target_group.adam-target.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "adam-lb-attach" {
  count      = length(var.cidr)
  depends_on = [aws_instance.web_server]

  target_group_arn = aws_lb_target_group.adam-target.arn
  target_id        = element(aws_instance.web_server.*.id, count.index)
  port             = var.def_port
}
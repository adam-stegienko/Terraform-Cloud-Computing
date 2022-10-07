module "Compute" {
  source     = "./modules/Compute"
  depends_on = [module.Network]

  adam_tags                  = var.adam_tags
  no_of_subnets              = var.no_of_subnets
  ec2_data                   = var.ec2_data
  init_file                  = var.init_file
  cidr_block                 = var.cidr_block
  availability_zone          = var.availability_zone
  health_check               = var.health_check
  alb_target                 = var.alb_target
  alb_balancer               = var.alb_balancer
  alb_listener               = var.alb_listener
  lb_listener_default_action = var.lb_listener_default_action
  lb_attachment_port         = var.lb_attachment_port
  aws_internet_gateway       = module.Network.aws_internet_gateway
  aws_security_group         = module.Network.aws_security_group
  aws_subnet                 = module.Network.aws_subnet
  aws_vpc                    = module.Network.aws_vpc

}

module "Network" {
  source = "./modules/Network"

  adam_tags            = var.adam_tags
  no_of_subnets        = var.no_of_subnets
  cidr_block           = var.cidr_block
  availability_zone    = var.availability_zone
  ingress_one          = var.ingress_one
  ingress_two          = var.ingress_two
  egress_all           = var.egress_all
  vpc_ip_range         = var.vpc_ip_range
  route_table_ip_range = var.route_table_ip_range
  lb_security_group    = var.lb_security_group
}
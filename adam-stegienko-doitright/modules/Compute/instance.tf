resource "aws_instance" "web_server" {
  count      = var.no_of_subnets
  depends_on = [data.aws_internet_gateway.adam-igw]

  ami                    = var.ec2_data["ami"]
  instance_type          = var.ec2_data["instance_type"]
  subnet_id              = element(data.aws_subnet.adam-terra-sub.*.id, count.index)
  vpc_security_group_ids = [data.aws_security_group.adam-sg.id]
  user_data              = file(var.init_file)
  
  tags                   = var.adam_tags
  volume_tags            = var.adam_tags
}


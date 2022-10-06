resource "aws_instance" "web_server" {
  count      = length(var.cidr)
  depends_on = [aws_internet_gateway.adam-igw]

  ami                    = var.custom_ami
  instance_type          = var.instance_size
  subnet_id              = element(aws_subnet.adam-terra-sub.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.adam-sg.id]
  user_data              = file(var.init_file)
  tags                   = var.adam_tags
  volume_tags            = var.adam_tags
}


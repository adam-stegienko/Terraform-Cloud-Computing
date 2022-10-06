resource "aws_instance" "web_server" {
  ami                    = var.custom_ami
  instance_type          = var.instance_size
  subnet_id              = element(aws_subnet.adam-terra-sub.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.adam-sg.id]
  user_data              = file(var.init_file)
  tags                   = var.adam_tags
  volume_tags            = var.adam_tags
  depends_on             = [aws_subnet.adam-terra-sub, aws_internet_gateway.adam-igw]
  count                  = length(var.cidr)
}


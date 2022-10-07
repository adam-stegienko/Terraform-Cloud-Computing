data "aws_vpc" "adam-vpc" {
  id = var.aws_vpc.id
}

data "aws_security_group" "adam-sg" {
  id = var.aws_security_group.id
}

data "aws_internet_gateway" "adam-igw" {
  internet_gateway_id = var.aws_internet_gateway.id
}
  
data "aws_subnets" "adam-terra-subs" {
  filter {
    values = [var.aws_vpc.id]
  }
}

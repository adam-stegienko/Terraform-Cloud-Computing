resource "aws_vpc" "adam-vpc" {
  cidr_block = var.vpc_ip_range

  tags = var.adam_tags
}

resource "aws_subnet" "adam-terra-sub" {
  count = var.no_of_subnets

  vpc_id                  = aws_vpc.adam-vpc.id
  cidr_block              = element(var.cidr_block, count.index)
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true

  tags = var.adam_tags
}

resource "aws_internet_gateway" "adam-igw" {
  vpc_id = aws_vpc.adam-vpc.id

  tags = var.adam_tags
}

resource "aws_route_table" "adam-rtb" {
  vpc_id = aws_vpc.adam-vpc.id

  tags = var.adam_tags

  route {
    cidr_block = var.route_table_ip_range
    gateway_id = aws_internet_gateway.adam-igw.id
  }
}

resource "aws_route_table_association" "adam_association" {
  count = var.no_of_subnets

  subnet_id      = element(aws_subnet.adam-terra-sub.*.id, count.index)
  route_table_id = aws_route_table.adam-rtb.id
}
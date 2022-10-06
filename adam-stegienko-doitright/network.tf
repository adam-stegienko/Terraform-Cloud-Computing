resource "aws_vpc" "adam-vpc" {
  cidr_block = var.ipv4_range[0]
}

resource "aws_subnet" "adam-terra-sub" {
  vpc_id            = aws_vpc.adam-vpc.id
  cidr_block        = element(var.cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)
  count             = length(var.cidr)
}

resource "aws_internet_gateway" "adam-igw" {
  vpc_id = aws_vpc.adam-vpc.id
}

resource "aws_route_table" "adam-rtb" {
  vpc_id = aws_vpc.adam-vpc.id

  route {
    cidr_block = var.ipv4_range[1]
    gateway_id = aws_internet_gateway.adam-igw.id
  }
}

resource "aws_route_table_association" "adam_association" {
  subnet_id      = element(aws_subnet.adam-terra-sub.*.id, count.index)
  route_table_id = aws_route_table.adam-rtb.id
  depends_on     = [aws_subnet.adam-terra-sub]
  count          = length(var.cidr)

}
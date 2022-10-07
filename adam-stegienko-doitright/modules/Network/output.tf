output "aws_internet_gateway" {
  value = aws_internet_gateway.adam-igw
}

output "aws_security_group" {
  value = aws_security_group.adam-sg
}

output "aws_vpc" {
  value = aws_vpc.adam-vpc
}

output "aws_subnet" {
  value = tolist(aws_subnet.adam-terra-sub[*])
}
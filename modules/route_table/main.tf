resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "TerraVPC-Public-Route-Table"
  }
}

resource "aws_route_table_association" "public_route_table_association_a" {
  subnet_id      = var.public_subnet_id_a
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_association_b" {
  subnet_id      = var.public_subnet_id_b
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table_a" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "TerraVPC-Private-Route-Table-A"
  }
}

resource "aws_route_table_association" "private_route_table_association_a" {
  subnet_id      = var.private_subnet_id_a
  route_table_id = aws_route_table.private_route_table_a.id
}

resource "aws_route_table" "private_route_table_b" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "TerraVPC-Private-Route-Table-B"
  }
}

resource "aws_route_table_association" "private_route_table_association_b" {
  subnet_id      = var.private_subnet_id_b
  route_table_id = aws_route_table.private_route_table_b.id
}

resource "aws_eip" "nat" {
   domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id # ID публичной подсети, где будет размещен NAT-шлюз
  tags = {
    Name = "TerraVPC-NAT-Gateway"
  }
}

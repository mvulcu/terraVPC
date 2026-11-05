variable "vpc_id" {
  description = "ID of the VPC for which the routing table is created"
  type = string
}

variable "igw_id" {
  description = "ID of the Internet gateway for routing"
  type = string
}

variable "public_subnet_id_a" {
  description = "ID of the first public subnet to associate with the routing table"
  type = string
}

variable "public_subnet_id_b" {
  description = "ID of the second public subnet to associate with the routing table"
  type = string
}

variable "private_subnet_id_a" {
  description = "ID of the first private subnet"
  type = string
}

variable "private_subnet_id_b" {
  description = "ID of the second private subnet"
  type = string
}

variable "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  type = string
}
variable "vpc_id" {
  description = "The ID of the VPC to which the subnets will be bound"
  type        = string
}

variable "public_subnet_cidr_a" {
  description = "CIDR block for public subnet A"
  type        = string
}

variable "public_subnet_cidr_b" {
  description = "CIDR block for public subnet B"
  type        = string
}

variable "private_subnet_cidr_a" {
  description = "CIDR block for private subnet A"
  type        = string
}

variable "private_subnet_cidr_b" {
  description = "CIDR block for private subnet B"
  type        = string
}

variable "availability_zone_a" {
  description = "Availability zone for subnet A"
  type        = string
}

variable "availability_zone_b" {
  description = "Availability zone for subnet B"
  type        = string
}

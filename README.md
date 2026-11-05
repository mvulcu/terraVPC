# TerraVPC

![Terraform CI](https://github.com/mvulcu/terraVPC/actions/workflows/terraform.yml/badge.svg)

Modular Terraform configuration for a two-AZ AWS VPC with public and private subnets, an internet gateway, a NAT gateway, route tables and a baseline security group.

## Architecture

```text
VPC 10.0.0.0/16  (eu-north-1)
├── Public subnet A  10.0.1.0/24  (eu-north-1a) ── NAT gateway (EIP)
├── Public subnet B  10.0.2.0/24  (eu-north-1b)
├── Private subnet A 10.0.3.0/24  (eu-north-1a)
├── Private subnet B 10.0.4.0/24  (eu-north-1b)
├── Internet gateway  → public route table  (0.0.0.0/0)
├── NAT gateway       → private route tables A and B (0.0.0.0/0)
└── Security group: HTTP 80 inbound, all outbound
```

## Modules

| Module | Resources |
|---|---|
| `modules/vpc` | `aws_vpc` |
| `modules/subnet` | Public and private `aws_subnet` across two AZs |
| `modules/igw` | `aws_internet_gateway` |
| `modules/nat_gateway` | `aws_eip`, `aws_nat_gateway` |
| `modules/route_table` | Public and private `aws_route_table` and associations |
| `modules/security_group` | `aws_security_group` |

Modules are wired together in `main.tf` through their outputs (VPC ID, subnet IDs, gateway IDs).

## Usage

Requirements: Terraform ≥ 1.5 and AWS credentials configured locally.

```bash
terraform init
terraform plan
terraform apply
```

Note that the NAT gateway and Elastic IP are billed by AWS while they exist. Run `terraform destroy` when you are done.

## CI

GitHub Actions runs static checks on every push and pull request, without cloud credentials and without plan or apply:

- `terraform fmt -check`
- `terraform init -backend=false` and `terraform validate`
- TFLint

## Possible improvements

- Remote state (S3 + DynamoDB locking)
- One NAT gateway per AZ for full high availability
- HTTPS (443) and restricted CIDRs in the security group
- VPC Flow Logs

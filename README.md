# Terraform AWS VPC Project

This Terraform project builds a basic AWS infrastructure:

## 🔧 Components

- A VPC with CIDR block `172.16.0.0/16`
- Public Subnet: `172.16.2.0/24`
- Private Subnet: `172.16.1.0/24`
- Internet Gateway for public access
- NAT Gateway for private subnet outbound access
- Route Tables (public & private)
- EC2 instance (t2.micro) in the private subnet — **Free Tier eligible**

## ✅ Built With

- Terraform v1.12.2
- AWS (Region: us-east-1)

## 🚀 Getting Started

```bash
terraform init
terraform plan
terraform apply
# AWS VPC Infrastructure with Terraform

This Terraform project provisions a basic AWS VPC infrastructure with the following components:

- VPC (`172.16.0.0/16`)
- Public Subnet (`172.16.2.0/24`)
- Private Subnet (`172.16.1.0/24`)
- Internet Gateway
- NAT Gateway
- Route Tables
- EC2 instance (`t2.micro`) in the **private** subnet

## 📌 Terraform Version
Tested with **Terraform v1.12.2**

## 🌍 AWS Region
`us-east-1` (N. Virginia)

## 💸 Cost
Fully free-tier eligible (as long as it's used responsibly — destroy when done). #cost only with nat gateway

## 🚀 How to Use
```bash
terraform init
terraform plan
terraform apply
![WhatsApp Image 2025-08-05 at 22 12 37 (1)](https://github.com/user-attachments/assets/b95c894f-89ec-4f02-ad92-0c179b7b0291)



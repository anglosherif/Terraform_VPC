# Terraform_VPC
terraform code used to creat a VPC inside my aws account .



📌 What I Built:
VPC with CIDR block 172.16.0.0/16

Created as the main virtual network to host all AWS resources.

Subnets:

Public Subnet: 172.16.2.0/24 – used for internet-facing resources like NAT Gateway.

Private Subnet: 172.16.1.0/24 – used to host internal resources like EC2 instances.

Internet Gateway:

Attached to the VPC to enable internet access for the public subnet.

NAT Gateway:

Deployed in the public subnet, allowing EC2 instances in the private subnet to access the internet securely (e.g., for updates, downloads) without exposing them directly.

EC2 Instance:

A t2.micro instance (Free Tier eligible) launched in the private subnet.

Used the default security group to keep the setup minimal.

Route Tables:

Public Route Table: Configured to route all outbound traffic (0.0.0.0/0) via the Internet Gateway.

Private Route Table: Configured to route outbound traffic (0.0.0.0/0) via the NAT Gateway.

Tagging & Naming:

All resources were consistently tagged (e.g., Name, Environment, etc.) for clarity, filtering, and cost tracking.

🧰 Tools & Services Used:
Terraform v1.12.2

AWS Free Tier (EC2, VPC, IGW, NAT, etc.)

Visual Studio Code (for editing)

AWS Console (for verification)

This project demonstrates my ability to:
✅ Design secure and scalable cloud network architectures
✅ Automate infrastructure using Terraform

# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "anglo-vpc"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "anglo-igw"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.16.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "anglo-public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "anglo-private-subnet"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "anglo-nat-eip"
  }
}

# NAT Gateway in Public Subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "anglo-nat-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}

# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "anglo-public-rt"
  }
}

# Route Table Association - Public
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table for Private Subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "anglo-private-rt"
  }
}

# Route Table Association - Private
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}

# Launch EC2 instance in private subnet
resource "aws_instance" "private_ec2" {
  ami           = "ami-08a6efd148b1f7504" # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  associate_public_ip_address = false

  tags = {
    Name = "anglo-private-ec2"
  }
}
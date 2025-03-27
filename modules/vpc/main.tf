resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "${var.environment}-vpc"
    }
}
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id
  
}

resource "aws_subnet" "public" {
    count = length(var.public_subnets)
    cidr_block = var.public_subnets[count.index]
    vpc_id = aws_vpc.main.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.names[count.index]

    tags = {
        Name = "${var.environment}-public-subnet-${count.index + 1}"
    }
}

data "aws_availability_zones" "available" {}
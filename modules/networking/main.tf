# setup vpc
resource "aws_vpc" "ak_infra_vpc" {
    cidr_block = var.ak_vpc_cidr
    tags = {
      Name = var.ak_vpc_name
    }
  
}
# setup public subnet
resource "aws_subnet" "ak_infra_pub_subnets" {
    count = length(var.ak_cidr_public_subnet)
    vpc_id = aws_vpc.ak_infra_vpc.id
    cidr_block = element(var.ak_cidr_public_subnet, count.index)
    availability_zone = element(var.ak_availability_zone, count.index)

    tags = {
      Name = "ak-infra-public-subnet-${count.index + 1}"
    }
  
}
# setup private subnet
resource "aws_subnet" "ak_infra_priv_subnets" {
    count = length(var.ak_cidr_private_subnet)
    vpc_id = aws_vpc.ak_infra_vpc.id
    cidr_block = element(var.ak_cidr_private_subnet, count.index)
    availability_zone = element(var.ak_availability_zone, count.index)

    tags = {
      Name = "ak-infra-private-subnet-${count.index + 1}"
    }
  
}
# setup internet gateway
resource "aws_internet_gateway" "ak_infra_igw" {
    vpc_id = aws_vpc.ak_infra_vpc.id
    tags = {
      Name = "ak_infra-igw"
    }
   
}
# setup public route table
resource "aws_route_table" "ak_infra_pub_rt" {
    vpc_id = aws_vpc.ak_infra_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ak_infra_igw.id
    }

    tags = {
      Name = "ak-infra-public-rt"
    }
  
}
resource "aws_route_table_association" "ak_infra_pub_rt_assoc" {
    count = length(aws_subnet.ak_infra_pub_subnets)
    subnet_id = aws_subnet.ak_infra_pub_subnets[count.index].id
    route_table_id = aws_route_table.ak_infra_pub_rt.id
  
}
# setup private route
resource "aws_route_table" "ak_infra_priv_rt" {
    vpc_id = aws_vpc.ak_infra_vpc.id
    # depends_on = [aws_nat_gateway.nat_gateway]
    tags = {
      Name = "ak-infra-private-rt"
    }
  
}
resource "aws_route_table_association" "ak_infra_priv_rt_assoc" {
    count = length(aws_subnet.ak_infra_priv_subnets)
    subnet_id = aws_subnet.ak_infra_priv_subnets[count.index].id
    route_table_id = aws_route_table.ak_infra_priv_rt.id
  
}
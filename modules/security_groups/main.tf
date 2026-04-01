resource "aws_security_group" "ak_infra_ec2_sg_http_ssh" {
    name = var.ak_ec2_sg_name
    description = "Enable port 22(SSH) and port 80(HTTP)"
    vpc_id = var.ak_vpc_id

    # ingress for ssh remote exec
    ingress {
        description = "Allow SSH from anywhere"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
    # enable http

    ingress {
        description = "Allow HTTP request from anywhere"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }

    # enable https
    ingress {
        description = "Allow HTTPS request from anywhere"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 443
        to_port = 443
        protocol = "tcp"
    }
    # Outgoing request
    egress {
        description = "Allow outgoing request"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "Security Group to allow SSH(22) and HTTP(80)"
    }

  
}
resource "aws_security_group" "ak_infra_rds_mysql_sg" {
    name = var.ak_rds_mysql_sg_name
    description = "Allow access to RDS from EC2 present in public subnet"
    vpc_id = var.ak_vpc_id

    ingress {
        description = "Allow mysql port 3306"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = var.ak_public_sub_cidr_block

    }

   
}
resource "aws_security_group" "ak_infra_ec2_sg_python_api" {
    name = var.ak_ec2_sg_name_python_api
    description = "Enable port 5000 for python api"
    vpc_id = var.ak_vpc_id
    ingress {
        description = "Allow traffic on port 5000"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 5000
        to_port = 5000
        protocol = "tcp"
    }

  
}

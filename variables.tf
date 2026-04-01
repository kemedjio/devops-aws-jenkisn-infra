variable "ak_domain_name" {
    description = "the frontend domain name"
    type = string
  
}
variable "ak_env" {
    description = "the environment"
  
}
variable "ak_ami_id" {
    description = "the ami id of the ec2 instance"
    type = string
  
}
variable "ak_instance_type" {
    description = "the type of the ec2 instance"
    type = string
  
}
variable "ak_tag_name" {
    description = "the tag name of the ec2"
    type = string
  
}
variable "ak_public_key" {
    description = "the public key of the ec2"
    type = string
  
}


variable "ak_enable_public_ip_address" {
    description = "enable public ip on launch"
    type = bool
  
}

variable "ak_ec2_sg_name_python_api" {
    description = "the security group for python api"
    type = string
  
}
variable "ak_aws_lb_dns_name" {
    description = "the dns name of the load balancer"
    type = string
  
}

variable "ak_lb_name" {
    description = "the name of the load balancer"
    type = string
  
}
variable "ak_lb_type" {
    description = "the load balancer type"
    type = string
  
}
variable "ak_is_external" {
    description = "the lb acces "
    type = bool
    default = false
  
}

variable "ak_lb_tag_name" {
    description = "the tag name for the load balancer"
    type = string
  
}


variable "ak_lb_listner_port" {
    description = "the listner port"
    type = number
  
}
variable "ak_lb_listner_protocol" {
    description = "the listner protocol"
    type = string
  
}
variable "ak_lb_listner_default_action" {
    description = "the default action of the listner"
    type = string
  
}
variable "ak_lb_https_listner_port" {
    description = "the lb https listner port"
    type = number
  
}
variable "ak_lb_https_listner_protocol" {
    description = "the listner protocol for https"
    type = string
  
}

variable "ak_lb_target_group_attachment_port" {
    description = "the port for target group attachment"
    type = number
  
}
variable "ak_lb_target_group_name" {
    description = "the name of the infra target group"
    type = string
  
}
variable "ak_lb_target_group_port" {
    description = "the name of the target group port"
    type = number
  
}
variable "ak_lb_target_group_protocol" {
    description = "the protocol of the target group"
    type = string
  
}

variable "ak_db_subnet_group_name" {
    description = "the subnet group of the database"
    type = string
  
}


variable "ak_mysql_db_identifier" {
    description = "the mysql db user identifier"
    type = string
  
}
variable "ak_mysql_username" {
    description = "the name of the mysql user"
    type = string
  
}
variable "ak_mysql_password" {
    description = "the mysql user password"
    type = string
  
}
variable "ak_mysql_dbname" {
    description = "the name of the mysql database"
    type = string
  
}
variable "ak_allocate_storage" {
    description = "the size of the db ebs"
    type = number
  
}
variable "ak_storage_type" {
    description = "the db storage type"
    type = string
  
}
variable "ak_engine_version" {
    description = "the mysql rds engine version"
    type = string

  
}
variable "ak_db_engine" {
    description = "the rds db engine"
    type = string
  
}
variable "ak_db_instance_class" {
    description = "the db inst class"
    type = string
  
}
variable "ak_vpc_cidr" {
    description = "the infra vpc cidr"
    type = string
  
}
variable "ak_vpc_name" {
    description = "the infra vpc name"
    type = string
  
}

variable "ak_cidr_private_subnet" {
    description = "the infra private subnet cidr"
    type = list(string)
  
}
variable "ak_availability_zone" {
    description = "the infra availability zone"
    type = list(string)
  
}

variable "ak_ec2_sg_name" {
    description = "the security group for the ec2 instance"
    type = string
  
}

variable "ak_public_sub_cidr_block" {
    description = "the public sub cidr block"
    type = list(string)
  
}

variable "ak_rds_mysql_sg_name" {
    description = "the name of the rds mysql "
    type = string
  
}

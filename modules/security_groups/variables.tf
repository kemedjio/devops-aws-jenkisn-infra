variable "ak_ec2_sg_name" {
    description = "the security group for the ec2 instance"
    type = string
  
}
variable "ak_vpc_id" {
    description = "the vpc id"
    type = string
  
}
variable "ak_public_sub_cidr_block" {
    description = "the public sub cidr block"
    type = list(string)
  
}
variable "ak_ec2_sg_name_python_api" {
    description = "the security group for the python api"
    type = string
  
}
variable "ak_rds_mysql_sg_name" {
    description = "the name of the rds mysql "
    type = string
  
}
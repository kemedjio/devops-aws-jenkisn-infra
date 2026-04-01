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
variable "ak_subnet_id" {
    description = "the subnet id of the ec2 instance "
    type = string
  
}
variable "ak_infra_ec2_sg_http_ssh" {
    description = "sg for https"
    type = string
  
}
variable "ak_enable_public_ip_address" {
    description = "enable public ip on launch"
    type = bool
  
}
variable "ak_user_data_install_apache" {
    description = "the user data for apache installation"
    type = string
  
}
variable "ak_ec2_sg_name_python_api" {
    description = "the security group for python api"
    type = string
  
}
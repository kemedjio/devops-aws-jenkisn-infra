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
variable "ak_vpc_id" {
    description = "the id of the vpc"
    type = string
  
}
variable "ak_ec2_instance_id" {
    description = "the infra ec2 id"
    type = string
  
}
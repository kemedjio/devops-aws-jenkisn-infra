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
variable "ak_ec2_sg_https_ssh" {
    description = "the sg for https"
    type = string
  
}
variable "ak_subnet_ids" {
    description = "the subnets for the load balancer"
    type = list(string)
  
}
variable "ak_lb_tag_name" {
    description = "the tag name for the load balancer"
    type = string
  
}
variable "ak_infra_lb_target_group_arn" {
    description = "the target group arn for load balancer"
    type = string
  
}
variable "ak_ec2_instance_id" {
    description = "the ec2 id"
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
variable "ak_acm_arn" {
    description = "the aws certificate arn"
    type = string
  
}
variable "ak_lb_target_group_attachment_port" {
    description = "the port for target group attachment"
    type = number
  
}
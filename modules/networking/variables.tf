variable "ak_vpc_cidr" {
    description = "the infra vpc cidr"
    type = string
  
}
variable "ak_vpc_name" {
    description = "the infra vpc name"
    type = string
  
}
variable "ak_cidr_public_subnet" {
    description = "the infra public subnet cidr"
    type = list(string)
  
}
variable "ak_cidr_private_subnet" {
    description = "the infra private subnet cidr"
    type = list(string)
  
}
variable "ak_availability_zone" {
    description = "the infra availability zone"
    type = list(string)
  
}
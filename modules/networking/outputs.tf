output "ak_vpc_id" {
    value = aws_vpc.ak_infra_vpc.id
  
}
output "ak_public_subnets" {
    value = aws_subnet.ak_infra_pub_subnets.*.id
  
}
output "ak_public_subnet_cidr_block" {
    value = aws_subnet.ak_infra_pub_subnets.*.cidr_block
  
}
output "ak_private_subnets" {
    value = aws_subnet.ak_infra_priv_subnets.*.id
  
}
output "ak_infra_ec2_sg_http_ssh_id" {
    value = aws_security_group.ak_infra_ec2_sg_http_ssh.id
  
}
output "ak_infra_rds_mysql_sg_id" {
    value = aws_security_group.ak_infra_rds_mysql_sg.id
  
}
output "ak_infra_ec2_sg_python_api_id" {
    value = aws_security_group.ak_infra_ec2_sg_python_api.id
  
}
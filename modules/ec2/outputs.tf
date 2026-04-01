output "ak_ssh_connection_string_for_ec2" {
    value = format("%s%s", "ssh -i /home/kemedjiokenlefakanicet/.ssh/id_rsa.pub ubuntu@", aws_instance.ak_infra_ec2.public_ip)
  
}
output "ak_ec2_instance_id" {
    value = aws_instance.ak_infra_ec2.id
  
}
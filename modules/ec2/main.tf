resource "aws_instance" "ak_infra_ec2" {
    ami = var.ak_ami_id
    instance_type = var.ak_instance_type
    vpc_security_group_ids = [var.ak_infra_ec2_sg_http_ssh, var.ak_ec2_sg_name_python_api]
    associate_public_ip_address = var.ak_enable_public_ip_address
    user_data = var.ak_user_data_install_apache
    key_name = aws_key_pair.ak_infra_public_key.key_name

    metadata_options {
      http_endpoint = "enabled"
      http_tokens = "required"
    }
    tags = {
      Name = var.ak_tag_name
    }
  
}
resource "aws_key_pair" "ak_infra_public_key" {
    key_name = "ak-infra-key"
    public_key = var.ak_public_key
  
}
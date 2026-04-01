module "networking" {
    source = "./modules/networking"
    ak_vpc_cidr = var.ak_vpc_cidr
    ak_vpc_name = var.ak_vpc_name
    ak_cidr_public_subnet = var.ak_public_sub_cidr_block
    ak_cidr_private_subnet = var.ak_cidr_private_subnet
    ak_availability_zone = var.ak_availability_zone
    
  
}
module "security_groups" {
    source = "./modules/security_groups"
    ak_ec2_sg_name = var.ak_ec2_sg_name
    ak_vpc_id = module.networking.ak_vpc_id
    ak_public_sub_cidr_block = tolist(module.networking.ak_public_subnet_cidr_block)
    ak_ec2_sg_name_python_api = var.ak_ec2_sg_name_python_api
    ak_rds_mysql_sg_name = var.ak_rds_mysql_sg_name
  
}
module "ec2" {
    source = "./modules/ec2"
    ak_ami_id = var.ak_ami_id
    ak_instance_type = var.ak_instance_type
    ak_tag_name = var.ak_tag_name
    ak_public_key = var.ak_public_key
    ak_subnet_id = tolist(module.networking.ak_public_subnets)[0]
    ak_infra_ec2_sg_http_ssh = module.security_groups.ak_infra_ec2_sg_http_ssh_id
    ak_ec2_sg_name_python_api = module.security_groups.ak_infra_ec2_sg_python_api_id
    ak_enable_public_ip_address = var.ak_enable_public_ip_address
    ak_user_data_install_apache = templatefile("./modules/template/ec2-install-apache.sh", {})
  
}
module "lb_target_group" {
    source = "./modules/load_balancer_group"
    ak_lb_target_group_name = var.ak_lb_target_group_name
    ak_lb_target_group_port = var.ak_lb_target_group_port
    ak_lb_target_group_protocol = var.ak_lb_target_group_protocol
    ak_vpc_id = module.networking.ak_vpc_id
    ak_ec2_instance_id = module.ec2.ak_ec2_instance_id
  
}
module "hosted_zone" {
    source = "./modules/hosted_zone"
    ak_domain_name = var.ak_domain_name
    ak_aws_lb_dns_name = module.alb.ak_aws_lb_dns_name
    ak_aws_lb_zon_id = module.alb.ak_aws_lb_zon_id
  
}
module "aws_certificate_manager" {
    source = "./modules/certificate_manager"
    ak_domain_name = var.ak_domain_name
    ak_env = var.ak_env
    ak_hosted_zone_id = module.hosted_zone.ak_hosted_zone_id
  
}
module "alb" {
    source = "./modules/load_balancer"
    ak_lb_name = var.ak_lb_name
    ak_is_external = var.ak_is_external
    ak_lb_type = var.ak_lb_type
    ak_ec2_sg_https_ssh = module.security_groups.ak_infra_ec2_sg_http_ssh_id
    ak_subnet_ids = tolist(module.networking.ak_public_subnets)
    ak_lb_tag_name = var.ak_lb_tag_name
    ak_infra_lb_target_group_arn = module.lb_target_group.ak_infra_lb_target_group_arn
    ak_ec2_instance_id = module.ec2.ak_ec2_instance_id
    ak_lb_listner_port = var.ak_lb_listner_port
    ak_lb_listner_protocol = var.ak_lb_listner_protocol
    ak_lb_https_listner_port = var.ak_lb_https_listner_port
    ak_lb_https_listner_protocol = var.ak_lb_https_listner_protocol
    ak_lb_listner_default_action = var.ak_lb_listner_default_action
    ak_lb_target_group_attachment_port = var.ak_lb_target_group_attachment_port
    ak_acm_arn = module.aws_certificate_manager.ak_acm_arn
  
}
module "rds_db_instance" {
    source = "./modules/mysql_rds"
    ak_allocate_storage = var.ak_allocate_storage
    ak_db_engine = var.ak_db_engine
    ak_db_instance_class = var.ak_db_instance_class
    ak_db_subnet_group_name = var.ak_db_subnet_group_name
    ak_engine_version = var.ak_engine_version
    ak_mysql_db_identifier = var.ak_mysql_db_identifier
    ak_mysql_dbname = var.ak_mysql_dbname
    ak_mysql_password = var.ak_mysql_password
    ak_mysql_username = var.ak_mysql_username
    ak_rds_mysql_sg_id = module.security_groups.ak_infra_rds_mysql_sg_id
    ak_storage_type = var.ak_storage_type
    ak_subnet_group = tolist(module.networking.ak_private_subnets)
  
}
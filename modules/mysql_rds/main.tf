resource "aws_db_subnet_group" "ak_infra_db_subnet_group" {
    name = var.ak_db_subnet_group_name
    subnet_ids = var.ak_subnet_group

  
}
resource "aws_db_instance" "default" {
    allocated_storage = var.ak_allocate_storage
    storage_type = var.ak_storage_type
    engine = var.ak_db_engine
    engine_version = var.ak_engine_version
    instance_class = var.ak_db_instance_class
    identifier = var.ak_mysql_db_identifier
    username = var.ak_mysql_username
    password = var.ak_mysql_password
    vpc_security_group_ids = [var.ak_rds_mysql_sg_id]
    db_subnet_group_name = aws_db_subnet_group.ak_infra_db_subnet_group.name
    db_name = var.ak_mysql_dbname
    skip_final_snapshot = true
    apply_immediately = true
    backup_retention_period = 0
    deletion_protection = false
  
}
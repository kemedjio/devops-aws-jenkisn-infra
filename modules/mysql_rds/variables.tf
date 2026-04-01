variable "ak_db_subnet_group_name" {
    description = "the subnet group of the database"
    type = string
  
}
variable "ak_subnet_group" {
    description = "the vpc subnet group"
    type = list(string)
  
}
variable "ak_rds_mysql_sg_id" {
    description = "the security group of the mysql rds"
    type = string
  
}
variable "ak_mysql_db_identifier" {
    description = "the mysql db user identifier"
    type = string
  
}
variable "ak_mysql_username" {
    description = "the name of the mysql user"
    type = string
  
}
variable "ak_mysql_password" {
    description = "the mysql user password"
    type = string
  
}
variable "ak_mysql_dbname" {
    description = "the name of the mysql database"
    type = string
  
}
variable "ak_allocate_storage" {
    description = "the size of the db ebs"
    type = number
  
}
variable "ak_storage_type" {
    description = "the db storage type"
    type = string
  
}
variable "ak_engine_version" {
    description = "the mysql rds engine version"
    type = string

  
}
variable "ak_db_engine" {
    description = "the rds db engine"
    type = string
  
}
variable "ak_db_instance_class" {
    description = "the db inst class"
    type = string
  
}
resource "aws_lb" "ak_infra_lb" {
    name = var.ak_lb_name
    internal = var.ak_is_external
    load_balancer_type = var.ak_lb_type
    security_groups = [var.ak_ec2_sg_https_ssh]
    subnets = var.ak_subnet_ids

    enable_deletion_protection = false

    tags = {
      Name = var.ak_lb_tag_name
    }
  
}
resource "aws_lb_target_group_attachment" "ak_infra_lb_target_group_attachment" {
    target_group_arn = var.ak_infra_lb_target_group_arn
    target_id = var.ak_ec2_instance_id
    port = var.ak_lb_target_group_attachment_port
  
}
resource "aws_lb_listener" "ak_infra_http_listner" {
    load_balancer_arn = var.ak_infra_lb_target_group_arn
    port = var.ak_lb_listner_port
    protocol = var.ak_lb_listner_protocol
    default_action {
      type = var.ak_lb_listner_default_action
      target_group_arn = var.ak_infra_lb_target_group_arn
    }
}
resource "aws_lb_listener" "ak_infra_https_listner" {
    load_balancer_arn = aws_lb.ak_infra_lb.arn
    port = var.ak_lb_https_listner_port
    protocol = var.ak_lb_https_listner_protocol
    ssl_policy = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
    certificate_arn = var.ak_acm_arn
    default_action {
      type = var.ak_lb_listner_default_action
      target_group_arn = var.ak_infra_lb_target_group_arn
    }
  
}

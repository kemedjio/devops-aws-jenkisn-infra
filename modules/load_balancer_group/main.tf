resource "aws_lb_target_group" "ak_infra_lb_target_group" {
    name = var.ak_lb_target_group_name
    port = var.ak_lb_target_group_port
    protocol = var.ak_lb_target_group_protocol
    vpc_id = var.ak_vpc_id

    health_check {
      path = "/health"
      port = 5000
      healthy_threshold = 6
      unhealthy_threshold = 2
      timeout = 2
      interval = 5
      matcher = "200"
    }
  
}
resource "aws_lb_target_group_attachment" "ak_infra_lb_target_group_attach" {
    target_group_arn = aws_lb_target_group.ak_infra_lb_target_group.arn
    target_id = var.ak_ec2_instance_id
    port = 5000
  
}
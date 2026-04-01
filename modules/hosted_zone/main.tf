data "aws_route53_zone" "ak_infra_zone" {
    name = var.ak_domain_name
    private_zone = false
  
}
resource "aws_route53_record" "ak_infra_lb_record" {
    zone_id = data.aws_route53_zone.ak_infra_zone.zone_id
    name = var.ak_domain_name
    type = "A"

    alias {
      name           = var.ak_aws_lb_dns_name
      zone_id        = var.ak_aws_lb_zon_id
      evaluate_target_health = true
    }
  
}
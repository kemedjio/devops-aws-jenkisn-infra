resource "aws_acm_certificate" "ak_infra_acm" {
    domain_name = var.ak_domain_name
    validation_method = "DNS"

    tags = {
      Environment = var.ak_env
    }
    lifecycle {
      create_before_destroy = false
    }
  
}
resource "aws_route53_record" "ak_route53_infra_record" {
    for_each = {
        for dvo in aws_acm_certificate.ak_infra_acm.domain_validation_options : dvo.domain_name => {
           name = dvo.resource_record_name
           record = dvo.resource_record_value
           type = dvo.resource_record_type 
        } 
       
    }
    zone_id = each.value.name
    name = each.value.name
    type = each.value.type
    records = [each.value.record]
    ttl = 60
  
}

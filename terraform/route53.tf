resource "aws_route53_zone" "kohlmeyer-ai" {
  name = "kohlmeyer-ai.com"
}

resource "aws_route53_record" "kohlmeyer-ai-ip4" {
  zone_id  = aws_route53_zone.kohlmeyer-ai.zone_id
  name     = var.domain
  type     = "A"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.kohlmeyer-ai.domain_name
    zone_id                = aws_cloudfront_distribution.kohlmeyer-ai.hosted_zone_id
  }
}

resource "aws_route53_record" "kohlmeyer-ai-ip6" {
  zone_id  = aws_route53_zone.kohlmeyer-ai.zone_id
  name     = var.domain
  type     = "AAAA"
  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.kohlmeyer-ai.domain_name
    zone_id                = aws_cloudfront_distribution.kohlmeyer-ai.hosted_zone_id
  }
}
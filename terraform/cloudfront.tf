resource "aws_cloudfront_distribution" "kohlmeyer-ai" {
  default_root_object = "index.html"
  enabled             = true
  is_ipv6_enabled     = true

  origin {
    domain_name = aws_s3_bucket_website_configuration.kohlmeyer-ai.website_endpoint
    origin_id   = aws_s3_bucket.kohlmeyer-ai.bucket_regional_domain_name
    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 30
      origin_ssl_protocols     = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    target_origin_id       = aws_s3_bucket.kohlmeyer-ai.bucket_regional_domain_name
    viewer_protocol_policy = "redirect-to-https"

  }

  custom_error_response {
    error_caching_min_ttl = 10
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }
  
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:014081376711:certificate/67389b1d-6dfd-44ce-8de6-ee9d1a5521f9"
    ssl_support_method  = "sni-only"
  }

  aliases    = [var.domain]
  depends_on = [aws_s3_bucket.kohlmeyer-ai]
}
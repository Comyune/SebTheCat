data "aws_acm_certificate" "main" {
  provider = aws.global
  domain = "sebthecat.com"
  statuses = ["ISSUED"]
  most_recent = true
}

resource "aws_cloudfront_distribution" "sebthecat_blog" {
  provider = aws.global
  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"
  aliases = ["sebthecat.com", "www.sebthecat.com"]
  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["US", "GB"]
    }
  }

  origin {
    domain_name = aws_s3_bucket.sebthecat_blog.bucket_regional_domain_name
    origin_id = local.s3_blog_origin_id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_blog_origin_id
    viewer_protocol_policy = "allow-all"
    min_ttl = 60
    default_ttl = 3600
    max_ttl = 86400

    forwarded_values {
      query_string = true
      cookies { forward = "none" }
    }
  }

  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.main.arn
    ssl_support_method = "sni-only"
  }

  tags = {
    Project = "sebthecat"
    Environment = "production"
  }
}
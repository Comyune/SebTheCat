+++
title = "Automatically Redirect to HTTPS in Cloudfront"
description = "Don't waste money redirecting to https with an AWS lambda."
date = "2020-06-07T11:27:15+01:00"
tags = [
  "devops",
  "terraform",
  "aws",
  "cloudfront",
  "lambda",
  "http",
  "https",
  "policy",
]
categories = [
  "Tips",
]
+++

Don't waste money redirecting to `https` with an `AWS lambda`.
Instead, set up a "viewer protocol policy" on the caching behaviour of your AWS Cloudfront distribution.

```hcl
viewer_protocol_policy = "redirect-to-https"
```

In context:

```hcl
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_blog_origin_id
    viewer_protocol_policy = "redirect-to-https"
    compress = true
    min_ttl = 60
    default_ttl = 3600
    max_ttl = 86400

    forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }
  }
```

__More Info:__

https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html
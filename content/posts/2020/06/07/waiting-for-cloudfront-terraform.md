+++
title = "Waiting for Cloudfront Distributions in Terraform"
description = "Tired of waiting for Cloudfront when you run Terraform? Use wait_for_deployment = false!"
date = "2020-06-07T13:27:15+01:00"
tags = [
  "devops",
  "terraform",
  "aws",
  "cloudfront",
  "distribution",
  "waiting",
  "slow",
  "stuck",
]
categories = [
  "Tips",
]
+++

Do you find working with the `aws_cloudfront_distribution` resource slow and painful?

If you work with AWS and Terraform regularly, surely you'll be familiar with the horrendous waiting times AWS callously submits us to.

A simple trick applied to your `aws_cloudfront_distribution` resource should do the trick!

```hcl
resource "aws_cloudfront_distribution" "main" {
  wait_for_deployment = false
}
```

Be careful though!
Any dependant resources might either timeout or fail, but it's no biggie ay, just rerun your `terraform apply` and you're away laughing.

__More Info:__

https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html

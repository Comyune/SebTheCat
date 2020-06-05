resource "aws_acm_certificate" "main" {
  provider = aws.global
  domain_name = "sebthecat.com"
  validation_method = "DNS"
  subject_alternative_names = ["*.sebthecat.com"]

  tags = {
    Project = "sebthecat"
    Environment = "production"
  }

  lifecycle { create_before_destroy = true }
}
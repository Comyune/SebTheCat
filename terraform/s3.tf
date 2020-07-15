resource "aws_s3_bucket" "sebthecat_blog" {
  bucket = "sebthecat.com"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["https://sebthecat.com", "https://www.sebthecat.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3600 // 1 hour
  }
}
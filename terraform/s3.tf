resource "aws_s3_bucket" "sebthecat_blog" {
  bucket = "sebthecat.com"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
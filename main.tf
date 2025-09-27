# create s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}

# Bucket Ownership Controls
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Public Access Block settings
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Upload index.html
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

# Upload error.html
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}

# Upload style.css
resource "aws_s3_object" "style" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "style.css"
  source       = "style.css"
  content_type = "text/css"
}

# nable static website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Bucket policy for public read access
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.mybucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${aws_s3_bucket.mybucket.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.example]
}
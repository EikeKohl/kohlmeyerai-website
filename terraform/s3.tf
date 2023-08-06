resource "aws_s3_bucket" "kohlmeyer-ai" {
  bucket   = var.domain
}

resource "aws_s3_bucket_public_access_block" "kohlmeyer-ai" {
  bucket   = aws_s3_bucket.kohlmeyer-ai.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "kohlmeyer-ai" {
  bucket   = aws_s3_bucket.kohlmeyer-ai.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "kohlmeyer-ai" {
  bucket   = aws_s3_bucket.kohlmeyer-ai.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
        ]
        Principal = "*"
        Effect    = "Allow"
        Resource  = "${aws_s3_bucket.kohlmeyer-ai.arn}/*"
      }
    ]
  })
}

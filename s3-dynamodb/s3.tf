resource "aws_s3_bucket" "terraform" {
  bucket = var.s3_bucket_name
  tags = {
    Name        = var.s3_bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform.id
  versioning_configuration {
    status = "Enabled"
  }
}
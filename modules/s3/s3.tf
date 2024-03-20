

resource "aws_s3_bucket" "s3-store" {
  bucket = "${terraform.workspace}-backend"

  tags = {
    Name = "${terraform.workspace}-backend"
    Environment = "Development"
  }
}


output "s3-backend-store-filename" {
  value = aws_s3_bucket.s3-store.arn
}
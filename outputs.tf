# Configure your outputs
output "main_endpoint" {
    value ="${aws_s3_bucket.Bucket.website_endpoint}"
}
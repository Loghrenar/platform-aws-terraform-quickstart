# Configure your outputs
output "main_endpoint" {
    value ="http://${aws_s3_bucket.Bucket.website_endpoint}"
}

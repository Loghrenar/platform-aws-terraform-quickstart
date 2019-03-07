# S3 bucket resource
resource "aws_s3_bucket" "Bucket" {
  bucket = "${var.bucket_name == "default" ? lower(random_string.bucket_random_name.result) : lower(var.bucket_name) }"
  acl    = "public-read"
  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement": [{
   "Sid": "AddPerm",
   "Effect": "Allow",
   "Principal": "*",
   "Action": ["s3:*"],
   "Resource": [
     "arn:aws:s3:::${var.bucket_name == "default" ? lower(random_string.bucket_random_name.result) : lower(var.bucket_name) }"
     "arn:aws:s3:::${var.bucket_name == "default" ? lower(random_string.bucket_random_name.result) : lower(var.bucket_name) }/*"
    ]
   }]
}
  EOF
  website {
    index_document = "index.html"
   }
    
}

# Upload index.html to S3 bucket
resource "aws_s3_bucket_object" "BucketObject" {
  depends_on = ["aws_s3_bucket.Bucket"]
  bucket = "${var.bucket_name}"
  key    = "index.html"
  source = "src/index.html"
  content_type = "text/html"
}

resource "random_string" "bucket_random_name" {
  length = 16
  special = false
}

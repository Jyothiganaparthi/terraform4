terraform {
  backend "s3" {
    bucket = "terrabuck90"
    key    = "main"
    region = "us-east-2"
    dynamo_db="dynamo425"
  }
}

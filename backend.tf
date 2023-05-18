terraform {
  backend "s3" {
    bucket = "terrabuck90"
    key    = "main"
    region = "us-east-2"
    dynamodb_table="dynamo425"
  }
}

provider "aws" {
  version    = "~> 4.0"
  region     = "us-east-1"
  access_key = "AKIA5CSGDCTDTGKB7JUD"
  secret_key = "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"

}
terraform {
  backend "s3" {
    bucket = "mybucket4250"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

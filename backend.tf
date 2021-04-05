terraform {
  backend "s3" {
      bucket = "test-terraform-iti"
      key = "iti/dev/terraform.tfstate"
      region = "us-east-1"
      dynamodb_table ="backend"
  }
}
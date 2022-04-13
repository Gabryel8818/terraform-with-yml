terraform {

  backend "s3" {
    bucket         = "state-workshop"
    key            = "workshop/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "workshop-locks"
  }
}

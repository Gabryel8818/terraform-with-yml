resource "aws_s3_bucket" "terraform_tfstate" {
  bucket        = "state-workshop"
  acl           = "private"
  force_destroy = false

  versioning {
    enabled = true
  }
}


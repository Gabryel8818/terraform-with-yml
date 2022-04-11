resource "aws_ecr_repository" "foo" {
  for_each             = {
    for repository in local.repositories : repository.name => repository
  }
  name                 = each.value.name
  image_tag_mutability = each.value.mutability
  tags                 = merge(local.config.default_tags, try(each.value.tags, {}))

  image_scanning_configuration {
    scan_on_push = true
  }

    encryption_configuration {
    encryption_type = "KMS"
  }
}

resource "aws_ecr_replication_configuration" "this" {
  for_each = {
    for repository in local.repositories : repository.name => repository
  }
  replication_configuration {
    rule {
      destination {
        region      = "us-east-2"
        registry_id = aws_ecr_repository.foo["${each.key}"].registry_id
      }
    }
  }
}
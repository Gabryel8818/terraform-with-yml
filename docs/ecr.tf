#resource "aws_ecr_repository" "this" {
#  for_each             = local.context_ecr[terraform.workspace]
#  name                 = each.key
#  image_tag_mutability = each.value.mutability
#
#  image_scanning_configuration {
#    scan_on_push = true
#  }
#}
#
#
#resource "aws_ecr_replication_configuration" "example" {
#  for_each = local.context_ecr[terraform.workspace]
#  replication_configuration {
#    rule {
#      destination {
#        region      = each.value.region_replication
#        registry_id = aws_ecr_repository.this["${each.key}"].id
#      }
#    }
#  }
#}



output "ecr_endpoints" {
  value = {
    for repo in aws_ecr_repository.foo : repo.name => repo.repository_url
  }
}

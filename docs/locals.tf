locals {
  repositories = [for _, value in fileset("./repos.d", "*yml") : yamldecode(file("./repos.d/${value}"))]
  config = yamldecode(file("./config.yml"))
}

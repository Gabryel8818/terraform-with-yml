locals {
  project = "ecr-platform"


  context_ecr = {
    stg = {
      node = {
        mutability         = "MUTABLE"
        region_replication = "us-east-2"
      }
    }

    prd = {
      node = {
        mutability         = "IMMUTABLE"
        region_replication = "us-east-2"
      }
    }

  }
}



locals {
  repositories = [for _, value in fileset("./repos.d", "*yml") : yamldecode(file("./repos.d/${value}"))]
  config       = yamldecode(file("./config.yml"))
}


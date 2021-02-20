terraform {
  backend "remote" {
    organization = "si3mshady-tf"

    workspaces {
      name = "kubernetes-sandbox"
    }
  }
}


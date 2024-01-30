terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

provider "aws" {
  region = "eu-central-1"
  profile = "alex"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

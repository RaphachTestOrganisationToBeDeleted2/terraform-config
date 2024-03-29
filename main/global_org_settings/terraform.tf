terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.0.0-rc2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "terraform-rapha-test-bucket"
    key = "global_org_settings_state.tfstate"
    region = "eu-central-1"
  }
}
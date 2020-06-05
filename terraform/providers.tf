provider "aws" {
  region = "eu-west-2"
  profile = "comyune.production.terraform"
}

provider "aws" {
  alias = "global"
  region = "us-east-1"
  profile = "comyune.production.terraform"
}

terraform {
  backend "s3" {
    skip_credentials_validation = true
    bucket = "terraform-state.comyune.com"
    key = "sebthecat-production.tfstate"
    region = "eu-west-2"
  }
}

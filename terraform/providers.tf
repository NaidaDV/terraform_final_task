provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "github" {
  token="ar.git_token
  owner="naidadv"
}

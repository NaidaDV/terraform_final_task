provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "github"{
  token="var.git_token"
  owner="naidadv"
}

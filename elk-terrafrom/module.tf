
resource "aws_key_pair" "elk_auth" {
  key_name   = var.aws_key_name
  public_key = file(var.aws_public_key_path)
}
module "vpc" {
  source = "./vpc"
  env    = var.env
  region = var.region
}

module "security" {
  source = "./security"
  vpc_id = module.vpc.out_vpc_id
}

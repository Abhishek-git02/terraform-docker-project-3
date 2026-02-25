provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}


module "asg" {
  source           = "./modules/asg"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  instance_type    = "t3.micro"
  ami_id           = "ami-0f9708d1cd2cfee41" # Amazon Linux 2 Mumbai
}
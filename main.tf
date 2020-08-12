provider "aws" {
  region     =  "eu-west-2" //"add your region"
  version    = "~> 2.0"
}


module "springboot_spa" {
  source            = "git::https://github.com/yogmangela/terra-modules//ec2"
  key_name          = // your .pem
  security_groups   = // your SG
  access_key        = //"your access_key"
  secret_key        = // "your secret_key"
  ami               = "ami-07d9160fa81ccffb5"
  count             = "2"
}




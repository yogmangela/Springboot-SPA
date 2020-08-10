provider "aws" {
  region     =  "eu-west-2" //"add your region"
  version    = "~> 2.0"
}


module "springboot-spa" {
   // access_key =  
   // secret_key =   
    source = "git::https://github.com/yogmangela/terra-modules//ec2"
    key_name="yogmicroservices"
    security_groups=["OpenToAllTraffic"]
    tags={
      Name = "springboot-spa"
    }
}

module "mongoDB" {
  source = "git::https://github.com/yogmangela/terra-modules//mongoDB"
  
}
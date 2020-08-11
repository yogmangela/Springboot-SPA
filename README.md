# Springboot Single Page Applicaation (SPA) 
- # High level overview Architect diagram.
![Springboot SPA](/images/MAXOPTRA.png)

# How to use this repo:

## there two stages to run this app
- ### Stage 1. To Install Git , NPM
- ### Stage 2. To Install MongoDB

### Stage 1. To Install Git , NPM

- Go to main.tf and add below: Key_name, SG, Access_Key, Secret_Key:

```
module "springboot-spa" {
    source           = "git::https://github.com/yogmangela/terra-modules//ec2"
    key_name         ="your .pem"
    security_groups  =["your existing SG"]
    access_key       =   //"your access_key"
    secret_key       =   // "your secret_key"
}

```

- Run 
```
Terraform init 
Terraform validate 
Terraform plan
Terraform apply -- Yes
```
- once you have EC2 up and running, SSH into EC2 and run below linux command to insatll Git repo and NPM server.

``
git clone https://github.com/yogmangela/single-spa-es5-angularjs.git
cd single-spa-es5-angularjs
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 4.4.5
npm install
npm start
``

- Once you have successflly executed above commands should look like below:

![NPM running](/images/NPM-running.PNG)

## make note of port it's running on : 8080
## go to EC2 dashboard make note of : Public DNS (IPv4)
## i.e: ec2-NN-NN-NN-NN.eu-west-1.compute.amazonaws.com
## and add port 8080 at the end of the endpoint:

ec2-NN-NN-NN-NN.eu-west-1.compute.amazonaws.com:8080
![Springboot app running](/images/npm-application.PNG)

# ********************************************************************

### Stage 2. To Install MongoDB

# 
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
    count            = 2
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

# Go to Ec2 instance and follow below instruction:

sudo -i
vi /etc/yum.repos.d/mongodb-org-4.4.repo

add 

```
[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc
```

press ESC key and type ":wq!" to save and come out of the vi editor

```
sudo yum install -y mongodb-org

sudo yum install -y mongodb-org-4.4.0 mongodb-org-server-4.4.0 mongodb-org-shell-4.4.0 mongodb-org-mongos-4.4.0 mongodb-org-tools-4.4.0

ps --no-headers -o comm 1

sudo systemctl start mongod
sudo systemctl daemon-reload
sudo systemctl status mongod

```
finall type ``mongo`` to go to db shell.

# see below:

![Springboot app running](/images/MongoDB.PNG)

### note: springboot and MongoDb are not connected yet. You will have to pass ENV variable in-order for you to connect stringboot and MongoDB.
 
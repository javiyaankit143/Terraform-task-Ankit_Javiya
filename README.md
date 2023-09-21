Terraform AWS Infrastructure
This repository contains a Terraform configuration that launches several public EC2 instances with one Classic Elastic Load Balancer.

Project Structure and File Description
project
   *README.md           
─── user-data
       *user-data-docker.sh --> Script to install Docker and Nginx Image using add script in Instance User Data
   *main.tf                 --> AWS Provider 
   *ec2.tf                  --> EC2 instances
   *lb.tf                   --> Classic Elastic Load Balancer 
   *vpc.tf                  --> VPC, Subnets, Route Tables, Route Table Association 
   *terraform.tfstate       --> State of configuration 
   *sgs.tf                  --> Security groups for EC2 and ALB
   *nat_gatways.tf          --> Create Nat Gatways
   *variables.tf             --> Defines variables
   *elastic_IP.tf           --> Create Elastic IP

Expectations
When terraform configuration is applied, a VPC is created along with public subnets and each subnet will have an EC2 instance that will provision a Nginx Docker container with an availability zone based on the region. A public facing Classic Load Balancer is created to balance the instances.

How to Use
Requirements
To use terraform configuration, make sure you have the following:

An AWS account
AWS CLI installed
terraform installed
keypair created (to ssh into instances)
Default Amis
Credentials and Setting Variables
To start, replace all necessary variables in terraform.tfvars and if necessary, variables.tf.

Example:
Access key and secret key are provided from your AWS account

access_key = "ACCESS_KEY" 
Launch Infrastructure
Run these terraform commands to launch the insfrastructure based on the configuration provided

$ terraform init
$ terraform plan
$ terraform apply

Destroy Infrastructure
Run this terraform command to destroy the insfrastructure

$ terraform destroy

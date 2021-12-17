# AWS_CLF-C01_TERRAFORM
The purpose of this repo is to store the terraform code and notes for the AWS cloud practitioner certification

This repo will be a mirror of a codecommit repo to work with using IAM.

As part of the study material the first steps will be the creation of the IAM user to access code commit and AWS resources 

Naming conventions
The terraform files will be named as follow:
{aws resource}_{opic}_todo.tf 
Example:
ec2_instance_todo.tf <- this one will have all the resources needed to create a EC2 instance following the activitied described in the course  -- https://www.udemy.com/course/aws-certified-cloud-practitioner-new/

Overall todo: 
Clone https://github.com/lat0z/terraform-s3-backend-setup to setup the s3 backend setup to store thte terraform state there
There will be different terraform workspaces to work with:
* One to specifically store the state of the codecommit setup, IAM initial user 
* One to store the state of the cloud practitioner resources 

The dev environment used to follow all of this is a implementation of vscode which is running as a web application inside a container https://github.com/gitpod-io/openvscode-server
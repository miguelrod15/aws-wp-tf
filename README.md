# aws-wp-tf

# AWS WordPress Terraform

This repository contains infrastructure as code (IaC) configuration to provision a WordPress environment on AWS using Terraform and Docker.

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/aws-wp-tf.git
   cd aws-wp-tf

## This Terraform project is structured into modular files for better organization and scalability:

 provider.tf – AWS provider and Terraform settings

 variables.tf – Input variables

 vpc.tf – VPC, subnets, route tables, internet gateway

 security_groups.tf – EC2 and RDS security groups with rules

 rds.tf – MySQL database instance (Free Tier)

 secrets.tf – Secure password generation and storage (Secrets Manager)

 ec2.tf – EC2 instance with Docker and WordPress via User Data

 user_data.sh – Shell script to configure WordPress container
 
 outputs.tf – Useful outputs (EC2 IP, RDS endpoint)

 All resources are provisioned following AWS Free Tier limitations.
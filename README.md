# ✅ Fully Automated WordPress Infrastructure on AWS with Terraform

This repository contains a complete and modular Terraform setup to deploy WordPress on AWS using best practices — including EC2, RDS, VPC, CloudWatch, IAM, and Secrets Manager.

---

## 📁 Project Structure


### 📄 Root Files

├── backend.tf ├── provider.tf ├── outputs.tf ├── variables.tf ├── user_data.sh


### 📦 Modules

modules/ 
├── ec2/ │ ├── main.tf │ ├── variables.tf │ └── outputs.tf 
├── rds/ │ ├── main.tf │ ├── variables.tf │ └── outputs.tf 
├── vpc/ │ ├── main.tf │ ├── variables.tf │ └── outputs.tf 
├── security_groups/ │ ├── main.tf │ ├── variables.tf │ └── outputs.tf 
├── secrets/ │ ├── main.tf │ ├── variables.tf │ └── outputs.tf 
├── iam/ │ ├── main.tf │ ├── variables.tf │ └── outputs.tf 
└── cloudwatch/ ├── main.tf ├── variables.tf └── outputs.tf

---

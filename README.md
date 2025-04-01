# aws-wp-tf

# AWS WordPress Terraform

This repository contains infrastructure as code (IaC) configuration to provision a WordPress environment on AWS using Terraform and Docker.

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/aws-wp-tf.git
   cd aws-wp-tf

## 📁 Key Files

- `ec2.tf` – EC2 instance with Docker + WordPress
- `user_data.sh` – Startup script for EC2
- `iam.tf` – IAM role for EC2 (SSM + CloudWatch)
- `cloudwatch.tf` – Dashboards and Log Groups
- `backends.tf` – Remote state (S3)
- `.github/workflows/terraform.yml` – GitHub Actions pipeline

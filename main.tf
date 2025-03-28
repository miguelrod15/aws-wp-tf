############################################################
#                  AWS WordPress Infrastructure            #
#   Terraform project to deploy a WordPress environment    #
#   using EC2, Docker, RDS, Security Groups and VPC setup  #
############################################################

# 🔹 All infrastructure components are modularized into separate files:
# - provider.tf         → AWS provider and Terraform settings
# - variables.tf        → Input variables
# - vpc.tf              → VPC, subnets, routes, and gateway
# - security_groups.tf  → Security groups and rules
# - rds.tf              → RDS MySQL instance
# - secrets.tf          → Secure password generation with Secrets Manager
# - ec2.tf              → EC2 instance with Docker + WordPress
# - outputs.tf          → Outputs for EC2 and RDS endpoints
# - user_data.sh        → Shell script for Docker-based WordPress setup

# All resources follow AWS Free Tier guidelines
# Sensitive values are never exposed in plain text

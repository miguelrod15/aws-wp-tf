#!/bin/bash
# Update packages and install Docker
sudo apt update -y
sudo apt install -y docker.io unzip curl

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Install CloudWatch Agent
cd /opt
sudo curl -O https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

# Create CloudWatch Agent config file
sudo mkdir -p /opt/aws/amazon-cloudwatch-agent/etc
sudo tee /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json > /dev/null <<EOF
{
  "metrics": {
    "metrics_collected": {
      "mem": {
        "measurement": [
          "mem_used_percent"
        ]
      },
      "disk": {
        "resources": ["/"],
        "measurement": [
          "used_percent"
        ]
      }
    },
    "append_dimensions": {
      "InstanceId": "\$${aws:InstanceId}"
    }
  }
}
EOF

# Start CloudWatch Agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
  -s

# Install and start SSM Agent
sudo snap install amazon-ssm-agent --classic
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

# Run WordPress container with CloudWatch logs enabled
sudo docker run -d \
  --name wordpress \
  -p 80:80 \
  -e WORDPRESS_DB_HOST=${db_host} \
  -e WORDPRESS_DB_USER=${db_username} \
  -e WORDPRESS_DB_PASSWORD=${db_password} \
  -e WORDPRESS_DB_NAME=${db_name} \
  --log-driver=awslogs \
  --log-opt awslogs-group=/ec2/wordpress \
  --log-opt awslogs-region=${region} \
  --log-opt awslogs-stream=wordpress-container \
  wordpress


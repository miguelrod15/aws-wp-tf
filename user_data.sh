#!/bin/bash
# Update and install required packages
sudo apt update -y
sudo apt install -y docker.io unzip curl

# Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

# Install CloudWatch Agent
cd /opt
curl -O https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

# CloudWatch Agent configuration
cat <<EOF > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
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

# Install and enable SSM Agent
sudo snap install amazon-ssm-agent --classic
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

# Remove any existing container
sudo docker rm -f wordpress || true

# Run WordPress container with logging and restart always
sudo docker run -d \
  --name wordpress \
  --restart always \
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


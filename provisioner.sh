#!/usr/bin/env bash

# Update package list
sudo apt update && sudo apt upgrade -y

# Install git
sudo apt install git -y

# Install SSM
wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
sudo dpkg -i amazon-ssm-agent.deb
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent

# Install CloudWatch Agent
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb
sudo systemctl start amazon-cloudwatch-agent
sudo systemctl enable amazon-cloudwatch-agent

# Install AWS Inspector
curl -O https://inspector-agent.amazonaws.com/linux/latest/install
sudo bash install

# Install Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo usermod -aG docker $USER
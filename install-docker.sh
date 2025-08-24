#!/bin/bash
set -e

# Update system
sudo apt update && sudo apt upgrade -y

# Install required packages
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker’s GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

# Add Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index
sudo apt update

# Install Docker
sudo apt install docker-ce -y

# Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

# Install Docker Compose (latest release)
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add user to docker group (so you can run docker without sudo)
sudo usermod -aG docker $USER

# Print versions
echo "✅ Docker installed: $(docker --version)"
echo "✅ Docker Compose installed: $(docker-compose --version)"
echo "👉 Please log out and log back in (or reboot) for group changes to take effect."

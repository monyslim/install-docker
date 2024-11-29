#!/bin/bash
set -e

# Check if a Docker version is specified
DOCKER_VERSION=${1:-latest}
echo "Installing Docker version: ${DOCKER_VERSION}"

# Update package index and install prerequisites
sudo apt-get update
sudo apt-get install -y ca-certificates curl

# Set up the Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker's official repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index again to include Docker packages
sudo apt-get update

# Install Docker components
if [ "$DOCKER_VERSION" == "latest" ] || [ -z "$DOCKER_VERSION" ]; then
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
  sudo apt-get install -y docker-ce=$DOCKER_VERSION docker-ce-cli=$DOCKER_VERSION containerd.io docker-buildx-plugin docker-compose-plugin
fi

# Verify Docker installation
docker --version
echo "Docker has been installed successfully."

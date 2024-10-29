#!/bin/bash

# Ensure script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Update and upgrade the system
echo "Updating the system..."
apt update -y && apt upgrade -y

echo "Adding repositories..."

# Add contrib and non-free repositories for additional packages
echo "deb http://deb.debian.org/debian/ $(lsb_release -sc) main contrib non-free" > /etc/apt/sources.list.d/contrib_non-free.list
apt update -y
# Install essential tools for GitHub Runner
echo "Installing GitHub Runner dependencies..."
apt install -y \
    build-essential \
    curl \
    git \
    jq \
    vim \
    wget \
    gnupg \
    lsb-release \
    ca-certificates \
    apt-transport-https

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do apt-get remove $pkg; done

# Add backports repository
echo "deb http://deb.debian.org/debian/ $(lsb_release -sc)-backports main contrib non-free" > /etc/apt/sources.list.d/backports.list

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add user to docker group for non-root Docker usage
usermod -aG docker $SUDO_USER

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y

# Add GitHub CLI repository
(type -p wget >/dev/null || (apt update && apt-get install wget -y)) \
	&& mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt update \
	&& apt install gh -y

# Cleanup
echo "Cleaning up..."
apt autoremove -y && apt clean

echo "Setup complete."

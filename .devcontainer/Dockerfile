# Use Gitpod's base image with Ubuntu
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install dependencies (curl, unzip, and sudo) and clean up apt cache to reduce image size
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download AWS CLI ARM64 version
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm -rf awscliv2.zip aws

# Verify installation of AWS CLI
RUN aws --version

# Install PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && sudo dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && sudo apt-get update \
    && sudo apt-get install -y powershell

# Verify installation of PowerShell
RUN pwsh --version

# Set working directory (you can change this as needed)
WORKDIR /workspace

# Set default environment variable for AWS CLI auto-prompt
ENV AWS_CLI_AUTO_PROMPT=on-partial
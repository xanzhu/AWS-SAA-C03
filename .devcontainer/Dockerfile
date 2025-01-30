# Use Gitpod's base image with Ubuntu
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install dependencies (curl, unzip, and sudo) and clean up apt cache to reduce image size
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    sudo \
    gnupg \
    software-properties-common \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download AWS CLI (ensure correct architecture)
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm -rf awscliv2.zip aws

# Verify AWS CLI installation
RUN aws --version

# Install PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && sudo dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && sudo apt-get update \
    && sudo apt-get install -y powershell

# Verify PowerShell installation
RUN pwsh --version

# Install Terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list \
    && sudo apt-get update \
    && sudo apt-get install -y terraform

# Verify Terraform installation
RUN terraform --version

# Install Node.js and NVM
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash \
#     && export NVM_DIR="$HOME/.nvm" \
#     && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
#     && nvm install 22

# # Install AWS CDK
# RUN npm install -g aws-cdk

# Set working directory
WORKDIR /workspace

# Set default environment variable for AWS CLI auto-prompt
ENV AWS_CLI_AUTO_PROMPT=on-partial
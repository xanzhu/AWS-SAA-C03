FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install dependencies (rarely changes, cached effectively)
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
    curl unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download and install AWS CLI (more likely to change)
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm -rf awscliv2.zip aws

# Verify installation
RUN aws --version
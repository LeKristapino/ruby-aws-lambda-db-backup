FROM amazonlinux:2023

ENTRYPOINT ["/bin/bash"]

# Create a mock /etc/redhat-release if needed
RUN echo "Amazon Linux release 2023 (Karoo)" > /etc/redhat-release

# Install your packages here
# For example, attempting to install PostgreSQL from PGDG
RUN dnf update && dnf install zip postgresql15.x86_64 postgresql15-server -y
WORKDIR /app

COPY . /app

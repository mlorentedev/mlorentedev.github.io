#!/bin/bash
# deploy.sh

# Get the directory of the script
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

# Set default environment to staging if not provided
ENVIRONMENT=${1:-staging}

# Set the working directory to the script's directory
if [ "$ENVIRONMENT" != "staging" ] && [ "$ENVIRONMENT" != "production" ]; then
  log_error "Not a valid environment. Use 'staging' or 'production'."
  exit 1
fi

# Load environment variables from the specified .env file
if [ ! -f ".env.$ENVIRONMENT" ]; then
  log_error "Environment file .env.$ENVIRONMENT not found."
  exit 1
fi
cp .env.$ENVIRONMENT .env

# Generate the Traefik configuration
./scripts/generate-traefik-config.sh

# Check acme.json file and permissions
touch traefik/acme.json
chmod 600 traefik/acme.json

# Deploy the Docker containers using docker-compose
docker-compose down
docker-compose up -d

log_success "Deployment to $ENVIRONMENT environment completed successfully."
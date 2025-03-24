#!/bin/bash
# deploy.sh

# Get the directory of the script
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

# Load utility functions
if [ ! -f "./scripts/utils.sh" ]; then
  echo "Error: utils.sh not found. Please ensure it exists."
  exit 1
fi
source ./scripts/utils.sh

# Check if version of Docker Compose is compatible
MIN_VERSION="1.26"
DOCKER_VERSION=$(docker version --format '{{.Client.APIVersion}}')
if [ "$(printf '%s\n' "$MIN_VERSION" "$DOCKER_VERSION" | sort -V | head -n1)" = "$MIN_VERSION" ] && [ "$DOCKER_VERSION" != "$MIN_VERSION" ]; then
  log_info "Docker Compose v1.26 or lower detected. Updating docker-compose to use version 2."
  DOCKER_COMPOSE_COMMAND="docker-compose"
else
  log_info "Docker Compose v1.27 or higher detected. Using docker compose command."
  DOCKER_COMPOSE_COMMAND="docker compose"
fi

# Validate environment parameter
ENVIRONMENT=${1:-}

if [ -z "$ENVIRONMENT" ]; then
  log_error "Usage: $0 <environment> (local, staging, or production)"
  exit 1
fi

if [ "$ENVIRONMENT" != "local" ] && [ "$ENVIRONMENT" != "staging" ] && [ "$ENVIRONMENT" != "production" ]; then
  log_error "Invalid environment: $ENVIRONMENT. Use 'local', 'staging', or 'production'."
  exit 1
fi

# Load environment variables from the specified .env file
if [ ! -f ".env.$ENVIRONMENT" ]; then
  log_error "Environment file .env.$ENVIRONMENT not found."
  exit 1
fi
cp .env.$ENVIRONMENT .env
source .env

# Stop running containers
log_info "Stopping existing containers..."
$DOCKER_COMPOSE_COMMAND -f docker-compose.$ENVIRONMENT.yml down

# Environment-specific configuration
./scripts/generate-traefik-config.sh
if [ "$ENVIRONMENT" != "local" ]; then
  log_info "Setting up production/staging environment..."
  touch traefik/acme.json
  chmod 600 traefik/acme.json  
  $DOCKER_COMPOSE_COMMAND -f docker-compose.$ENVIRONMENT.yml pull
else
  log_info "Setting up local development environment..."
fi

# Start containers
log_info "Starting containers for $ENVIRONMENT environment..."
$DOCKER_COMPOSE_COMMAND -f docker-compose.$ENVIRONMENT.yml up -d $([[ "$ENVIRONMENT" == "local" ]] && echo "--build")

log_success "Deployment to $ENVIRONMENT environment completed successfully."
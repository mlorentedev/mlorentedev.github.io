#!/bin/bash
# generate-traefik-config.sh

# Get the directory of the script
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

# Load environment variables from .env file if it exists
if [ -f ".env" ]; then
  source .env
fi

# Set default values for Traefik configuration
# These can be overridden by environment variables
TRAEFIK_DASHBOARD=${TRAEFIK_DASHBOARD:-true}
TRAEFIK_INSECURE=${TRAEFIK_INSECURE:-true}
WEB_PORT=${WEB_PORT:-80}
SECURE_PORT=${SECURE_PORT:-443}
ACME_SERVER=${ACME_SERVER:-"https://acme-staging-v02.api.letsencrypt.org/directory"}
ACME_EMAIL=${ACME_EMAIL:-"mlorentedev@gmail.com"}

# Create the traefik directory if it doesn't exist
mkdir -p traefik

# Generate the Traefik configuration file from the template
cat traefik/traefik.template.yml | \
  sed "s/{{TRAEFIK_DASHBOARD}}/$TRAEFIK_DASHBOARD/g" | \
  sed "s/{{TRAEFIK_INSECURE}}/$TRAEFIK_INSECURE/g" | \
  sed "s/{{WEB_PORT}}/$WEB_PORT/g" | \
  sed "s/{{SECURE_PORT}}/$SECURE_PORT/g" | \
  sed "s#{{ACME_SERVER}}#$ACME_SERVER#g" | \
  sed "s/{{ACME_EMAIL}}/$ACME_EMAIL/g" > traefik/traefik.yml

log_success "Traefik configuration generated successfully."
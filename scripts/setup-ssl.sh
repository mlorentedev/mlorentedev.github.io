#!/bin/bash

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"
source "$SCRIPT_DIR/../.env"

# Check dependencies
check_dependencies "openssl" "docker" "docker-compose"

# Environment variables
export DOMAIN=${DOMAIN:-mlorente.dev}
export ADMIN_EMAIL=${ADMIN_EMAIL:-your@email.com}
export DOCKERHUB_USERNAME=${DOCKERHUB_USERNAME:-mlorentedev}
export ARTIFACT_NAME=${ARTIFACT_NAME:-mlorentedev-static}

# Check if required variables are set
if [ -z "$DOMAIN" ]; then
  exit_error "DOMAIN environment variable is not set. Please set it before running this script."
fi

if [ -z "$ADMIN_EMAIL" ]; then
  exit_error "ADMIN_EMAIL environment variable is not set. Please set it before running this script."
fi

log_info "Starting SSL certificate setup for production environment (Domain: $DOMAIN, Email: $ADMIN_EMAIL)"

# Create directories for certbot
log_info "Creating certbot directories..."
mkdir -p ./certbot/www
mkdir -p ./certbot/conf

# Create temporary certificates
log_info "Creating temporary certificates..."
mkdir -p ./certbot/conf/live/$DOMAIN

openssl req -x509 -nodes -days 1 -newkey rsa:2048 \
  -keyout ./certbot/conf/live/$DOMAIN/privkey.pem \
  -out ./certbot/conf/live/$DOMAIN/fullchain.pem \
  -subj "/CN=$DOMAIN" -batch

cp -f ./certbot/conf/live/$DOMAIN/fullchain.pem ./certbot/conf/live/$DOMAIN/chain.pem

# Create Nginx config files if they don't exist
if [ ! -d "./nginx/conf" ]; then
  log_info "Creating Nginx configuration..."
  mkdir -p nginx/conf
  mkdir -p nginx/templates
  
  # Create nginx.conf
  cat > nginx/conf/nginx.conf << EOF
user nginx;
worker_processes auto;
pid /var/run/nginx.pid;

events {
    worker_connections 1024;
    multi_accept on;
}

http {
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
    server_tokens off;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_types text/plain text/css application/javascript text/xml application/xml application/xml+rss text/javascript;

    include /etc/nginx/conf.d/*.conf;
}
EOF

  # Create default.conf.template
  cat > nginx/templates/default.conf.template << EOF
server {
    listen 80;
    listen [::]:80;
    server_name ${DOMAIN} www.${DOMAIN};

    # Redirection for certbot
    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    # Redirect all HTTP traffic to HTTPS
    location / {
        return 301 https://$host$request_uri;
    }
}

# HTTPS configuration
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    http2 on;
    server_name ${DOMAIN} www.${DOMAIN};

    # SSL certificates
    ssl_certificate /etc/letsencrypt/live/${DOMAIN}/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/${DOMAIN}/privkey.pem;

    # SSL configuration
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:10m;
    ssl_session_tickets off;
    ssl_stapling on;
    ssl_stapling_verify on;

    # HSTS (comment if you're not sure)
    add_header Strict-Transport-Security "max-age=63072000" always;

    # Root directory
    root /usr/share/nginx/html;
    index index.html;

    # Static site configuration
    location / {
        try_files $uri $uri/ /index.html =404;
        
        # Additional security
        add_header X-Frame-Options "SAMEORIGIN" always;
        add_header X-XSS-Protection "1; mode=block" always;
        add_header X-Content-Type-Options "nosniff" always;
        add_header Referrer-Policy "no-referrer-when-downgrade" always;
    }

    # Static resources
    location ~* \.(css|js|jpg|jpeg|png|gif|ico|svg|woff|woff2|ttf|eot)$ {
        expires 30d;
        add_header Cache-Control "public, no-transform";
    }
}
EOF
fi

# Create docker-compose.yml file if it doesn't exist
if [ ! -f "./docker-compose.yml" ]; then
  log_info "Creating docker-compose.yml file..."
  cat > docker-compose.yml << EOF
services:
  website:
    image: $DOCKERHUB_USERNAME/$ARTIFACT_NAME:latest
    build:
      context: .
      dockerfile: Dockerfile
    container_name: $ARTIFACT_NAME
    restart: always
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./certbot/www:/var/www/certbot/:ro
      - ./certbot/conf:/etc/letsencrypt/:ro
    environment:
      - DOMAIN=$DOMAIN
    networks:
      - web
    depends_on:
      - certbot

  certbot:
    image: certbot/certbot:latest
    container_name: ${ARTIFACT_NAME}_certbot
    volumes:
      - ./certbot/www:/var/www/certbot/:rw
      - ./certbot/conf:/etc/letsencrypt/:rw
    entrypoint: "/bin/sh -c 'trap exit TERM; while :; do certbot renew; sleep 12h & wait \$\${!}; done;'"
    networks:
      - web

networks:
  web:
    driver: bridge
EOF
fi

# Make sure we have the image
log_info "Building Docker image..."
docker compose build

# Start Nginx container with temporary certificates
log_info "Starting Nginx with temporary certificates..."
docker compose up -d website || {
  exit_error "Failed to start Nginx container. Check the Docker image and configuration."
}

# Wait for Nginx to be ready
log_info "Waiting for Nginx to be ready..."
sleep 5

# Stop Nginx
log_info "Stopping Nginx to obtain real certificates..."
docker compose stop website

# Remove temporary certificates
rm -rf ./certbot/conf/live/$DOMAIN

# Get real certificates for main domain
log_info "Obtaining certificates for $DOMAIN..."
docker compose run --rm certbot certonly --webroot --webroot-path=/var/www/certbot \
  --email $ADMIN_EMAIL --agree-tos --no-eff-email --force-renewal \
  -d $DOMAIN -d www.$DOMAIN || {
    log_warning "Failed to obtain certificates for $DOMAIN. Using self-signed certificates instead."
    
    # Create self-signed certificates if Let's Encrypt fails
    mkdir -p ./certbot/conf/live/$DOMAIN
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
      -keyout ./certbot/conf/live/$DOMAIN/privkey.pem \
      -out ./certbot/conf/live/$DOMAIN/fullchain.pem \
      -subj "/CN=$DOMAIN" -batch
    cp -f ./certbot/conf/live/$DOMAIN/fullchain.pem ./certbot/conf/live/$DOMAIN/chain.pem
}

# Start all services
log_info "Starting services with SSL certificates..."
docker compose up -d || {
  exit_error "Failed to start services. Check the configuration and certificates."
}

log_success "SSL certificate setup complete for production environment!"
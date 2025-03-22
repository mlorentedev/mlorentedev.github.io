# Stage 1: Build the Jekyll site
FROM ruby:3.3-alpine AS builder

# Set the working directory
WORKDIR /app

# Install dependencies for building
RUN apk add --no-cache build-base

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./
COPY Appraisals ./

# Install Jekyll and dependencies
RUN bundle install && bundle exec appraisal install

# Copy the rest of the site
COPY . .

# Build the site
RUN bundle exec appraisal jekyll build

# Use nginx as base image
FROM nginx:alpine

# Copy website content to nginx html directory
COPY . /usr/share/nginx/html

# Remove unnecessary files from the html directory
RUN rm -rf /usr/share/nginx/html/Dockerfile \
           /usr/share/nginx/html/docker-compose.yml \
           /usr/share/nginx/html/.git \
           /usr/share/nginx/html/scripts \
           /usr/share/nginx/html/.gitignore \
           /usr/share/nginx/html/nginx 2>/dev/null || true

# Copy nginx configuration
COPY nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY nginx/templates/default.conf.template /etc/nginx/templates/

# Create folder for Nginx logs and set permissions
RUN mkdir -p /var/log/nginx && \
    chown -R nginx:nginx /var/log/nginx /usr/share/nginx/html

# Expose ports
EXPOSE 80 443

# Environment variables
ENV DOMAIN=mlorente.dev

# Default command
CMD ["nginx", "-g", "daemon off;"]
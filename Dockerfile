# Stage 1: Build the Jekyll site
FROM ruby:3.3-alpine AS builder

# Set the working directory
WORKDIR /app

# Install dependencies for building
RUN apk add --no-cache build-base

# Copy Gemfile
COPY Gemfile ./

# Install Jekyll and dependencies
RUN gem install bundler && bundle install

# Copy the rest of the site
COPY . .

# Build the site
RUN bundle exec appraisal install
RUN bundle exec appraisal jekyll build

# Stage 2: Serve the static site with nginx
FROM nginx:alpine

# Copy built site from the builder stage
COPY --from=builder /app/_site /usr/share/nginx/html

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
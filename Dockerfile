# Stage 1: Build the Jekyll site
FROM ruby:3.3-alpine AS builder

# Install system dependencies
RUN apk add --no-cache \
    build-base \
    git \
    bash \
    zlib-dev

# Set working directory
WORKDIR /app

# Set up gem home in user directory
ENV GEM_HOME="/home/jekyll/gems"
ENV PATH="/home/jekyll/gems/bin:$PATH"

# Create non-root user
RUN addgroup -S jekyll && adduser -S jekyll -G jekyll

# Change ownership
RUN mkdir -p /app && chown -R jekyll:jekyll /app

# Switch to non-root user
USER jekyll

# Copy Gemfile and Gemfile.lock
COPY --chown=jekyll:jekyll Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle config set --local path 'vendor/bundle' && \
    bundle install

# Copy the rest of the site
COPY --chown=jekyll:jekyll . .

# Build the site
RUN bundle exec jekyll build

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
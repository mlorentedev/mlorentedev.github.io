# Stage 1: Build the Jekyll site
FROM ruby:3.2.3-slim-bullseye

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    zlib1g-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install specific Bundler version
RUN gem install bundler -v 2.5.22

# Copy entire project (including gemspec)
COPY . .

# Install dependencies 
RUN bundle config set --local path 'vendor/bundle' && \
    bundle install

# Build the site
RUN bundle exec jekyll build

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy built site
COPY --from=0 /app/_site /usr/share/nginx/html

# Expose port
EXPOSE 80

# Default command
CMD ["nginx", "-g", "daemon off;"]
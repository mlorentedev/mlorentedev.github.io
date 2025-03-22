FROM ruby:3.1-alpine

# Add Jekyll dependencies to Alpine
RUN apk update
RUN apk add --no-cache build-base gcc cmake git
RUN apk add --no-cache musl-dev
RUN gem update bundler && gem install bundler -v 2.5.22

# Set the working directory inside the container
WORKDIR /srv/jekyll

# Install dependencies and setup Jekyll environment
COPY Gemfile* ./
RUN bundle config set --local force_ruby_platform true
RUN bundle install

# Copy the entire Jekyll site into the container
COPY . /srv/jekyll

# Expose the necessary port for the Jekyll site
EXPOSE 4000

# Run Jekyll's built-in server (adjust as needed)
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"]

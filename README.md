# My personal blog site

My personal site built with Jekyll, containerized with Docker, and deployed using Traefik for SSL termination and reverse proxy.

## Project Overview

This project is a personal blogging platform built using Jekyll static site generator. The website is containerized using Docker and can be deployed to different environments (local, staging, production) with automated CI/CD pipelines. Traefik is used as a reverse proxy and for SSL certificate management.

## Features

- Static website built with Jekyll
- Fully responsive design
- Containerized with Docker
- Automated builds via GitHub Actions
- SSL certificates managed by Traefik via Let's Encrypt
- Content categories and tags
- Reading time estimation
- Markdown support for content
- SEO optimized

## Project Structure

```bash
├── .github/               # GitHub Actions workflow configurations
├── jekyll/                # Jekyll website source code
│   ├── _posts/            # Blog post content
│   ├── _layouts/          # Page layouts
│   ├── _includes/         # Reusable components
│   ├── assets/            # Static assets (CSS, JS, images)
│   ├── _config.yml        # Jekyll configuration
│   └── Dockerfile         # Docker image definition for Jekyll
├── scripts/               # Deployment and utility scripts
│   ├── deploy.sh          # Main deployment script
│   ├── generate-traefik-config.sh # Traefik configuration generator
│   └── utils.sh           # Utility functions
├── traefik/               # Traefik configuration
│   ├── traefik.template.yml # Template for Traefik configuration
│   └── acme.json          # Let's Encrypt certificates storage
├── .env.example           # Example environment configuration
├── docker-compose.yml     # Docker Compose service definitions
└── README.md              # Project documentation
```

## Prerequisites

- Docker and Docker Compose
- Git
- A DockerHub account for storing container images
- A domain name (for staging and production environments)
- A server with SSH access (for staging and production)

## Local Development

To run the project locally:

1. Clone the repository

   ```bash
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo
   ```

2. Create a local environment file

   ```bash
   cp .env.example .env.local
   ```

3. Edit `.env.local` with your local configuration

   ```.env.local
   # Site
   ARTIFACT_NAME=blog-site
   DOMAIN=localhost
   EMAIL=your-email@example.com

   # DockerHub
   DOCKERHUB_USERNAME=your-dockerhub-username
   DOCKERHUB_TOKEN=your-dockerhub-token

   # Environment
   ENVIRONMENT=local
   WEB_PORT=80
   SECURE_PORT=443
   TRAEFIK_DASHBOARD=true
   TRAEFIK_INSECURE=true
   ```

4. Copy to `.env` file

   ```bash
   cp .env.local .env
   ```

5. Generate Traefik configuration

   ```bash
   ./scripts/generate-traefik-config.sh
   ```

6. Set up acme.json file

   ```bash
   touch traefik/acme.json
   chmod 600 traefik/acme.json
   ```

7. Start the containers

   ```bash
   docker-compose up -d
   ```

8. Access your site at http://localhost

### Using Your DockerHub Image

If you already have the image in DockerHub and want to use it instead of building locally:

1. Edit the `docker-compose.yml` file to use your image:

   ```yaml
   services:
     jekyll:
       image: "${DOCKERHUB_USERNAME}/${ARTIFACT_NAME}:latest"
       # Comment out the build section
       #build:
       #  context: ./jekyll
       #  dockerfile: Dockerfile
   ```

2. Make sure your environment variables are set correctly in `.env`

3. Start the containers

   ```bash
   docker-compose up -d
   ```

## Deploying to Staging

To deploy to a staging environment:

1. Copy all necessary files to your staging server. You can use `scp` or any other file transfer method. For example:

   ```bash
   scp -r scripts/ user@staging-server:/opt/your-project/
   scp -r traefik/ user@staging-server:/opt/your-project/
   scp .env.example user@staging-server:/opt/your-project/.env.staging
   scp docker-compose.yml user@staging-server:/opt/your-project/
   ```

2. Edit `.env.staging` with your staging configuration

   ```.env.staging
   # Site
   ARTIFACT_NAME=blog-site
   DOMAIN=staging.your-domain.com
   EMAIL=your-email@example.com

   # DockerHub
   DOCKERHUB_USERNAME=your-dockerhub-username
   DOCKERHUB_TOKEN=your-dockerhub-token

   # Environment
   ENVIRONMENT=staging
   WEB_PORT=80
   SECURE_PORT=443
   TRAEFIK_DASHBOARD=true
   TRAEFIK_INSECURE=true
   ACME_SERVER=https://acme-staging-v02.api.letsencrypt.org/directory
   ```

3. Make the scripts executable

   ```bash
   chmod +x scripts/*.sh
   ```

4. Run the deployment script

   ```bash
   ./scripts/deploy.sh staging
   ```

This script will:

- Copy `.env.staging` to `.env`
- Generate the Traefik configuration
- Check the acme.json file and permissions
- Stop running containers if any
- Start the containers with the new configuration

## Deploying to Production

The process for deploying to production is similar to staging:

1. Copy all necessary files to your production server. You can use `scp` or any other file transfer method. For example:

   ```bash
   scp -r scripts/ user@production-server:/opt/your-project/
   scp -r traefik/ user@production-server:/opt/your-project/
   scp .env.example user@production-server:/opt/your-project/.env.production
   scp docker-compose.yml user@production-server:/opt/your-project/
   ```

2. Edit `.env.production` with your production configuration

   ```.env.production
   # Site
   ARTIFACT_NAME=blog-site
   DOMAIN=your-domain.com
   EMAIL=your-email@example.com

   # DockerHub
   DOCKERHUB_USERNAME=your-dockerhub-username
   DOCKERHUB_TOKEN=your-dockerhub-token

   # Environment
   ENVIRONMENT=production
   WEB_PORT=80
   SECURE_PORT=443
   TRAEFIK_DASHBOARD=false
   TRAEFIK_INSECURE=false
   ACME_SERVER=https://acme-v02.api.letsencrypt.org/directory
   ```

3. Make the scripts executable

   ```bash
   chmod +x scripts/*.sh
   ```

4. Run the deployment script with "production" parameter

   ```bash
   ./scripts/deploy.sh production
   ```

**Note**: For production, we use the Let's Encrypt production ACME server rather than the staging one. Be careful not to exceed their rate limits.

## CI/CD Pipeline

The project includes a GitHub Actions workflow that:

1. Builds the Jekyll site
2. Creates a Docker image
3. Pushes the image to DockerHub
4. Creates deployment artifacts

To set up the CI/CD pipeline:

1. Add these secrets to your GitHub repository:
   - `DOCKERHUB_USERNAME`: Your DockerHub username
   - `DOCKERHUB_TOKEN`: Your DockerHub access token
   - `ARTIFACT_NAME`: The name of your Docker image

2. Push to the `master` branch to trigger the build and deployment process

## Troubleshooting

If you encounter issues with the deployment:

1. Check container status

   ```bash
   docker ps
   ```

2. Review container logs

   ```bash
   docker-compose logs jekyll
   docker-compose logs traefik
   ```

3. Verify Traefik configuration

   ```bash
   cat traefik/traefik.yml
   ```

4. Check SSL certificates  
    If you are using Traefik with Let's Encrypt, ensure that the `acme.json` file has the correct permissions and contains valid certificates:

   ```bash
   docker-compose exec traefik cat /acme.json
   ```

5. Restart the containers  
    If you make changes to the configuration or environment variables, you may need to restart the containers:

   ```bash
   docker-compose down
   docker-compose up -d
   ```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
# Stage 1: Build assets
FROM debian AS builder

# Install Node.js and build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set working directory
WORKDIR /var/www

# Copy Laravel application code
COPY . /var/www

# Install Node.js dependencies and build assets
RUN npm install && npm run build

# Stage 2: Nginx production image
FROM nginx:alpine

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy Laravel's public assets (from the builder stage)
COPY --from=builder /var/www/public /var/www/public

# Ensure proper permissions for www-data (Nginx default user)
#RUN chown -R www-data:www-data /var/www/public

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

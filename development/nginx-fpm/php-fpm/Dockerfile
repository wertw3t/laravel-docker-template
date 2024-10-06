# Stage 1: Build environment
FROM php:8.3-fpm AS builder

# Install system dependencies and build libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    # libpq-dev is required for PostgreSQL
    libpq-dev \
    libonig-dev \
    libssl-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    && docker-php-ext-install -j$(nproc) \
    # PHP Extensions required for Laravel. See https://laravel.com/docs/11.x/deployment#server-requirements
    # Most of these extensions are already included in the base image.
    pdo_pgsql \
    pgsql \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Stage 2: Runtime environment
FROM php:8.3-fpm

# Set environment variables for user and group ID
ARG UID=1000
ARG GID=1000

# Create a user with the same UID and GID as the host user
RUN groupadd -g ${GID} www && \
    useradd -u ${UID} -g www -m www

# Copy only the necessary PHP extensions from the build stage
COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-*/ /usr/local/lib/php/extensions/no-debug-non-zts-*/

# Set working directory
WORKDIR /var/www

# Change ownership of the working directory to the new user
RUN chown -R www:www /var/www

# Switch to the non-root user
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]

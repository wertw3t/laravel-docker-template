#!/bin/sh
set -e

# Check if the storage directory is empty (initial start)
if [ ! "$(ls -A /var/www/storage)" ]; then
  echo "Initializing storage directory..."
  cp -R /var/www/storage-init/. /var/www/storage
  chown -R www-data:www-data /var/www/storage
fi

# Run the default command
exec "$@"

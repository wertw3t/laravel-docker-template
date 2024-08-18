#!/bin/bash

# Ensure that the .env file exists
if [ ! -f .env ]; then
    cp .env.example .env
fi

# Override .env variables with the values passed during runtime
for var in $(env); do
    key=$(echo "$var" | cut -d '=' -f 1)
    value=$(echo "$var" | cut -d '=' -f 2)
    
    # Check if the key exists in the .env file and update it
    if grep -q "^$key=" .env; then
        sed -i "s/^$key=.*/$key=$value/" .env
    fi
done

# Continue with the default CMD
exec "$@"
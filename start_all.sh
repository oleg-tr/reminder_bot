#!/bin/bash

# Start Rails server in the background
echo "Starting Rails server..."
rails server -p 4000 &

# Start Sidekiq for background jobs
echo "Starting Sidekiq..."
bundle exec sidekiq &

# Start ngrok
echo "Starting ngrok..."
ngrok http 3000

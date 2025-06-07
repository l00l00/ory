#!/bin/bash

echo "📦 Loading .env..."
export $(grep -v '^#' .env | xargs)

echo "🛠️ Creating acme.json with secure permissions..."
mkdir -p ./letsencrypt
touch ./letsencrypt/acme.json
chmod 600 ./letsencrypt/acme.json

echo "📁 Ensuring data directories exist..."
mkdir -p ./data/n8n ./data/flowise ./data/postgres

echo "🚀 Starting your AI stack..."
docker compose up -d --build

echo "✅ All services started. Access them at:"
echo "🔹 Traefik:     https://traefik.${DOMAIN}"
echo "🔹 n8n:         https://n8n.${DOMAIN}"
echo "🔹 Flowise:     https://flow.${DOMAIN}"
echo "🔹 Kratos UI:   https://auth.${DOMAIN}"
echo "🔹 Supabase:    https://db.${DOMAIN}"

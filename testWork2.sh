#!/usr/bin/env bash
#
# Envoi du sample_inventory.csv à n8n via Webhook /upload

# Chemin vers le CSV local
CSV_PATH="./sample_inventory.csv"

# URL complète de ton Webhook (copiée depuis n8n)
WEBHOOK_URL="https://n8n-pe2c.onrender.com/webhook-test/generate-pdf"

# Si tu utilises une API Key pour sécuriser ton Webhook
API_KEY="<ta_clé>"

# Exécute le curl
curl -X POST "$WEBHOOK_URL" \
  -H "x-api-key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
        "system_id":1,
        "name":"Chatbot Support",
        "description":"Assistant client IA",
        "owner":"alice",
        "go_live_date":"2025-01-01",
        "category":"LOW_RISK",
        "dpia_required":false,
        "risks":[]
      }'
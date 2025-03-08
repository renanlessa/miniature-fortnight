#!/bin/bash

if [ -z "$1" ]; then
    echo "Por favor, forneça o ID do serviço de streaming"
    echo "Uso: ./delete.sh ID"
    exit 1
fi

# Primeiro faça login para obter o token
TOKEN=$(curl -s -X POST \
  http://localhost:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "admin@example.com",
    "password": "admin123"
}' | grep -o '"token":"[^"]*' | cut -d'"' -f4)

# Deletar serviço de streaming por ID
curl -X DELETE \
  http://localhost:8080/flix/stream-service/$1 \
  -H "Authorization: Bearer ${TOKEN}" 
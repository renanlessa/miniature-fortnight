#!/bin/bash

# Solicitar nome do serviço de streaming
echo "Digite o nome do serviço de streaming:"
read service_name

if [ -z "$service_name" ]; then
    echo "O nome do serviço é obrigatório"
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

# Criar serviço de streaming
curl -X POST \
  http://localhost:8080/flix/stream-service \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${TOKEN}" \
  -d "{
    \"name\": \"$service_name\"
}" 
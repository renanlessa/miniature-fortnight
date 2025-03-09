#!/bin/bash

# Primeiro faça login para obter o token
TOKEN=$(curl -s -X POST \
  http://localhost:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "admin@example.com",
    "password": "admin123"
}' | grep -o '"token":"[^"]*' | cut -d'"' -f4)

# Listar todos os serviços de streaming
curl -X GET \
  http://localhost:8080/flix/stream-service \
  -H "Authorization: Bearer ${TOKEN}" 
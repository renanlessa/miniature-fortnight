#!/bin/bash

if [ -z "$1" ]; then
    echo "Digite o ID da categoria:"
    read category_id
    
    if [ -z "$category_id" ]; then
        echo "O ID da categoria é obrigatório"
        echo "Uso: ./get.sh ID"
        exit 1
    fi
else
    category_id=$1
fi

# Primeiro faça login para obter o token
TOKEN=$(curl -s -X POST \
  http://localhost:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "admin@example.com",
    "password": "admin123"
}' | grep -o '"token":"[^"]*' | cut -d'"' -f4)

# Buscar categoria por ID
curl -X GET \
  http://localhost:8080/flix/category/$category_id \
  -H "Authorization: Bearer ${TOKEN}" 
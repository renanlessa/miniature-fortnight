#!/bin/bash

# Solicitar nome da categoria se não foi fornecido
echo "Digite o nome da categoria:"
read category_name

if [ -z "$category_name" ]; then
    echo "O nome da categoria é obrigatório"
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

# Criar categoria
curl -X POST \
  http://localhost:8080/flix/category \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${TOKEN}" \
  -d "{
    \"name\": \"$category_name\"
}" 
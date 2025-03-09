#!/bin/bash

# Primeiro faça login para obter o token
TOKEN=$(curl -s -X POST \
  http://localhost:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "admin@example.com",
    "password": "admin123"
}' | grep -o '"token":"[^"]*' | cut -d'"' -f4)

# Função para criar serviço de streaming
create_service() {
    local name="$1"
    echo "Cadastrando serviço: $name"
    
    curl -s -X POST \
      http://localhost:8080/flix/stream-service \
      -H 'Content-Type: application/json' \
      -H "Authorization: Bearer ${TOKEN}" \
      -d "{
        \"name\": \"$name\"
      }"
    
    echo -e "\n"
}

# Cadastrar serviços
create_service "Netflix"
create_service "Prime Video"
create_service "Disney+"
create_service "HBO Max"
create_service "Globoplay"

echo "Todos os serviços foram cadastrados!" 
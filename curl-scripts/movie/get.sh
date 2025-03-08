#!/bin/bash

if [ -z "$1" ]; then
    echo "Digite o ID do filme:"
    read movie_id
    
    if [ -z "$movie_id" ]; then
        echo "O ID do filme é obrigatório"
        echo "Uso: ./get.sh ID"
        exit 1
    fi
else
    movie_id=$1
fi

# Primeiro faça login para obter o token
TOKEN=$(curl -s -X POST \
  http://localhost:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "admin@example.com",
    "password": "admin123"
}' | grep -o '"token":"[^"]*' | cut -d'"' -f4)

# Buscar filme por ID
curl -X GET \
  http://localhost:8080/flix/movie/$movie_id \
  -H "Authorization: Bearer ${TOKEN}" 
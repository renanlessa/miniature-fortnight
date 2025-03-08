#!/bin/bash

# Solicitar dados do filme
echo "Digite o título do filme:"
read title

if [ -z "$title" ]; then
    echo "O título do filme é obrigatório"
    exit 1
fi

echo "Digite a descrição do filme:"
read description

echo "Digite a data de lançamento (formato: dd/mm/yyyy):"
read release_date

if [ -z "$release_date" ]; then
    echo "A data de lançamento é obrigatória"
    exit 1
fi

echo "Digite a nota do filme (0-10):"
read rating

if [ -z "$rating" ]; then
    echo "A nota do filme é obrigatória"
    exit 1
fi

echo "Digite os IDs das categorias (separados por vírgula):"
read categories
categories=$(echo $categories | sed 's/,/","/g')

echo "Digite os IDs dos serviços de streaming (separados por vírgula):"
read services
services=$(echo $services | sed 's/,/","/g')

# Primeiro faça login para obter o token
TOKEN=$(curl -s -X POST \
  http://localhost:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "admin@example.com",
    "password": "admin123"
}' | grep -o '"token":"[^"]*' | cut -d'"' -f4)

# Criar filme
curl -X POST \
  http://localhost:8080/flix/movie \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${TOKEN}" \
  -d "{
    \"title\": \"$title\",
    \"description\": \"$description\",
    \"releaseDate\": \"$release_date\",
    \"rating\": $rating,
    \"categories\": [\"$categories\"],
    \"services\": [\"$services\"]
}" 
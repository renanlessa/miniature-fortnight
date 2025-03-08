#!/bin/bash

if [ -z "$1" ]; then
    echo "Digite o ID do filme que deseja atualizar:"
    read movie_id
    
    if [ -z "$movie_id" ]; then
        echo "O ID do filme é obrigatório"
        echo "Uso: ./update.sh ID"
        exit 1
    fi
else
    movie_id=$1
fi

# Solicitar dados do filme
echo "Digite o novo título do filme:"
read title

if [ -z "$title" ]; then
    echo "O título do filme é obrigatório"
    exit 1
fi

echo "Digite a nova descrição do filme:"
read description

echo "Digite a nova data de lançamento (formato: dd/mm/yyyy):"
read release_date

if [ -z "$release_date" ]; then
    echo "A data de lançamento é obrigatória"
    exit 1
fi

echo "Digite a nova nota do filme (0-10):"
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

# Atualizar filme
curl -X PUT \
  http://localhost:8080/flix/movie \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${TOKEN}" \
  -d "{
    \"id\": $movie_id,
    \"title\": \"$title\",
    \"description\": \"$description\",
    \"releaseDate\": \"$release_date\",
    \"rating\": $rating,
    \"categories\": [\"$categories\"],
    \"services\": [\"$services\"]
}" 
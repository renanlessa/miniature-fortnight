#!/bin/bash

# Primeiro faça login para obter o token
TOKEN=$(curl -s -X POST \
  http://localhost:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "admin@example.com",
    "password": "admin123"
}' | grep -o '"token":"[^"]*' | cut -d'"' -f4)

# Função para criar categoria
create_category() {
    local name="$1"
    echo "Cadastrando categoria: $name"
    
    curl -s -X POST \
      http://localhost:8080/flix/category \
      -H 'Content-Type: application/json' \
      -H "Authorization: Bearer ${TOKEN}" \
      -d "{
        \"name\": \"$name\"
      }"
    
    echo -e "\n"
}

# Cadastrar categorias
create_category "Ação"
create_category "Comédia"
create_category "Drama"
create_category "Ficção Científica"
create_category "Terror"

echo "Todas as categorias foram cadastradas!" 
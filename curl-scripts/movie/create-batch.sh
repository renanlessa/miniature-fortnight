#!/bin/bash

# Função para extrair o ID do serviço de streaming baseado no logo
get_service_id() {
    local logo=$1
    case $logo in
        *"netflix"*) echo "1";;
        *"apple"*) echo "2";;
        *"claro"*) echo "3";;
        *) echo "1";;  # Netflix como padrão
    esac
}

# Função para converter rating de aprovação para escala 0-10
convert_rating() {
    local rating=$1
    echo "scale=1; $rating / 10" | bc
}

# Primeiro faça login para obter o token
TOKEN=$(curl -s -X POST \
  http://localhost:8080/auth/login \
  -H 'Content-Type: application/json' \
  -d '{
    "email": "admin@example.com",
    "password": "admin123"
}' | grep -o '"token":"[^"]*' | cut -d'"' -f4)

# Lista de filmes para cadastrar
create_movie() {
    local title="$1"
    local description="$2"
    local rating="$3"
    local service_id="$4"
    
    echo "Cadastrando filme: $title"
    
    curl -s -X POST \
      http://localhost:8080/flix/movie \
      -H 'Content-Type: application/json' \
      -H "Authorization: Bearer ${TOKEN}" \
      -d "{
        \"title\": \"$title\",
        \"description\": \"$description\",
        \"releaseDate\": \"01/01/2024\",
        \"rating\": $rating,
        \"categories\": [\"1\"],
        \"services\": [\"$service_id\"]
      }"
    
    echo -e "\n"
}

# Cadastrar O Poderoso Chefão
create_movie "O Poderoso Chefão" \
            "Don Corleone, chefe da máfia, precisa passar o legado para seu filho Michael, que reluta em assumir os negócios da família." \
            $(convert_rating 87) \
            $(get_service_id "apple")

# Cadastrar Matrix
create_movie "Matrix" \
            "Um programador descobre que a realidade como conhecemos é uma simulação criada por máquinas e se une a um grupo de rebeldes para libertar a humanidade." \
            $(convert_rating 92) \
            $(get_service_id "netflix")

# Cadastrar Inception
create_movie "Inception" \
            "Um ladrão especializado em roubar informações através dos sonhos recebe uma missão impossível: plantar uma ideia na mente de alguém." \
            $(convert_rating 89) \
            $(get_service_id "claro")

# Cadastrar O Senhor dos Anéis
create_movie "O Senhor dos Anéis" \
            "Um hobbit recebe a missão de destruir um anel mágico que pode salvar ou destruir a Terra-média." \
            $(convert_rating 95) \
            $(get_service_id "netflix")

# Cadastrar Pulp Fiction
create_movie "Pulp Fiction" \
            "Várias histórias se entrelaçam em Los Angeles, envolvendo assassinos, boxeadores, gângsteres e criminosos." \
            $(convert_rating 91) \
            $(get_service_id "apple")

# Cadastrar O Silêncio dos Inocentes
create_movie "O Silêncio dos Inocentes" \
            "Uma agente do FBI busca a ajuda de um canibal preso para capturar um serial killer." \
            $(convert_rating 88) \
            $(get_service_id "claro")

echo "Todos os filmes foram cadastrados!" 
#!/bin/bash

# Verifica se o token foi fornecido como argumento
if [ -z "$1" ]; then
    echo "Por favor, forneça o token como argumento."
    echo "Uso: ./validate-token.sh <token>"
    exit 1
fi

TOKEN=$1

echo "Validando token..."
echo "URL: http://localhost:8080/auth/validate"
echo "Token: ${TOKEN}"

# Faz a requisição HEAD para validar o token com mais informações de debug
response=$(curl -i -s \
    -X HEAD \
    http://localhost:8080/auth/validate \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "Content-Type: application/json")

# Extrai o código de status da resposta
status_code=$(echo "$response" | head -n 1 | cut -d' ' -f2)

echo -e "\nResposta completa:"
echo "$response"
echo -e "\nCódigo de status: $status_code"

# Verifica o código de resposta
if [ "$status_code" -eq 200 ]; then
    echo "Token válido!"
elif [ "$status_code" -eq 401 ]; then
    echo "Token inválido ou expirado!"
elif [ "$status_code" -eq 404 ]; then
    echo "Erro: Endpoint não encontrado!"
else
    echo "Erro inesperado!"
fi

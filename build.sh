#!/bin/bash

echo "Iniciando build do projeto..."

# Limpar builds anteriores e compilar
mvn clean package -DskipTests

# Verificar se o build foi bem sucedido
if [ $? -eq 0 ]; then
    echo "Build concluído com sucesso!"
    echo "O arquivo JAR foi gerado em target/"
else
    echo "Erro durante o build do projeto"
    exit 1
fi
#!/bin/bash

# Build da imagem
docker build -t prodigasite:builder --build-arg RAILS_ENV=production .

# Criar container temporário
docker create --name temp-container prodigasite:builder

# Extrair arquivos compilados
mkdir -p ./build-output
docker cp temp-container:/app/public/assets ./build-output/
docker cp temp-container:/app/app ./build-output/
docker cp temp-container:/app/config ./build-output/

# Limpar container temporário
docker rm temp-container

echo "Arquivos extraídos em ./build-output/"
#!/bin/bash

# Configurações
AWS_REGION="us-east-1"
ECR_REPOSITORY="prodigasite"

# Criar repositório ECR
aws ecr create-repository \
    --repository-name $ECR_REPOSITORY \
    --region $AWS_REGION \
    --image-scanning-configuration scanOnPush=true

echo "Repositório ECR criado: $ECR_REPOSITORY"
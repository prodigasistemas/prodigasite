#!/bin/bash

# Configurações
AWS_REGION="us-east-1"
ECR_REPOSITORY="prodigasite"

# Obter URI do ECR
ECR_URI=$(aws ecr describe-repositories --repository-names $ECR_REPOSITORY --region $AWS_REGION --query 'repositories[0].repositoryUri' --output text)

# Substituir placeholder no JSON
sed "s|YOUR_ECR_URI|$ECR_URI|g" deploy/apprunner-service.json > deploy/apprunner-service-final.json

# Criar serviço App Runner
aws apprunner create-service \
    --cli-input-json file://deploy/apprunner-service-final.json \
    --region $AWS_REGION

echo "Serviço App Runner criado com sucesso!"
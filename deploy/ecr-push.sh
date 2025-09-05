#!/bin/bash

# Configurações
AWS_REGION="us-east-1"
ECR_REPOSITORY="prodigasite"
IMAGE_TAG="latest"

# Obter URL do repositório ECR
ECR_URI=$(aws ecr describe-repositories --repository-names $ECR_REPOSITORY --region $AWS_REGION --query 'repositories[0].repositoryUri' --output text)

# Login no ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URI

# Build da imagem
docker build -t $ECR_REPOSITORY:$IMAGE_TAG --build-arg RAILS_ENV=production .

# Tag da imagem
docker tag $ECR_REPOSITORY:$IMAGE_TAG $ECR_URI:$IMAGE_TAG

# Push da imagem
docker push $ECR_URI:$IMAGE_TAG

echo "Imagem enviada para: $ECR_URI:$IMAGE_TAG"
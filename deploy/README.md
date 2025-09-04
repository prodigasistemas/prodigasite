# Deploy AWS App Runner

## Pré-requisitos
- AWS CLI configurado
- Docker instalado
- Permissões IAM para ECR e App Runner

## Passos para Deploy

### 1. Criar repositório ECR
```bash
chmod +x deploy/create-ecr.sh
./deploy/create-ecr.sh
```

### 2. Fazer push da imagem
```bash
chmod +x deploy/ecr-push.sh
./deploy/ecr-push.sh
```

### 3. Criar serviço App Runner
```bash
chmod +x deploy/create-apprunner.sh
./deploy/create-apprunner.sh
```

### 4. Verificar status
```bash
aws apprunner describe-service --service-arn YOUR_SERVICE_ARN --region us-east-1
```

## Configurações de Produção

### Variáveis de Ambiente
- `RAILS_ENV=production`
- `RACK_ENV=production`
- `TZ=America/Belem`
- `LANG=pt_BR.UTF-8`

### Recursos
- CPU: 0.25 vCPU
- Memória: 0.5 GB
- Auto-scaling habilitado

## Custos Estimados
- App Runner: ~$25-50/mês
- ECR: ~$1/mês
- Data Transfer: Variável
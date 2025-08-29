# [Prodiga Site](https://github.com/prodigasistemas/prodigasite)

Site institucional da Prodiga Sistemas desenvolvido em Ruby on Rails.

## Executando com Docker

### Pré-requisitos

- Docker
- Docker Compose

### Configuração

1. Clone o repositório:
```bash
git clone https://github.com/prodigasistemas/prodigasite.git
cd prodigasite
```

2. O arquivo `Dockerfile` já está incluído no projeto.

```
FROM ruby:2.7.4

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get update -qq && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --without test

COPY . .

ARG RAILS_ENV
ENV RAILS_ENV=${RAILS_ENV}

RUN    SECRET_KEY_BASE=$(bundle exec rake secret) ${RAILS_ENV} bundle exec rake assets:precompile \
    && groupadd -r rails \
    && useradd -r -g rails rails \
    && chown -R rails:rails /app

USER rails

EXPOSE 3000 4000

CMD ["sh", "-c", "SECRET_KEY_BASE=$(bundle exec rake secret) bundle exec puma -C config/puma.rb"]

```


3. Crie o arquivo `docker-compose.yml`:
```yaml
version: '3.8'

services:
  web:
    build: .
    ports:
      - "3000:3000"
    environment:
      - RAILS_ENV=production
      - RACK_ENV=production
      - PORT=3000
    volumes:
      - .:/app
    command: bundle exec puma -C config/puma.rb
```

### Executando a aplicação

1. Construir e executar os containers:
```bash
docker-compose up --build
```

2. A aplicação estará disponível em: `http://localhost:3000`


**Nota:** O site funcionará normalmente, mas o formulário de contato apresentará erro ao tentar enviar emails.

### Executando manualmente

1. Construir a imagem:
```bash
docker build -t prodigasite:1.0.0 --build-arg RAILS_ENV=production .
```

2. Executar container:
```bash
docker container run \
      --detach \
      --restart always \
      --name site \
      --publish 3000:3000 \
      --env RAILS_ENV=production \
      --env RACK_ENV=production \
      --env TZ=America/Belem \
      --env LANG=pt_BR.UTF-8 \
      prodigasite:1.0.0
```

3. Criar serviço Docker Swarm:
```bash
docker service create \
      --name site \
      --publish 3000:3000 \
      --env RAILS_ENV=production \
      --env RACK_ENV=production \
      --env TZ=America/Belem \
      --env LANG=pt_BR.UTF-8 \
      --restart-condition any \
      --replica 1 \
      prodigasite:1.0.0
```

### Tecnologias utilizadas

- Ruby 2.7.4
- Rails 4.2.8
- Puma (servidor web)
- SendGrid (envio de emails)
- High Voltage (páginas estáticas)

### Estrutura da aplicação

- Site institucional com páginas estáticas
- Formulário de contato com envio por email
- Assets otimizados para produção
- Configuração para deploy no Heroku


### WSL

  rsync -azv --exclude=.git --exclude=credentials ~/prodiga/prodigasite ~

  find ~/prodigasite -type d -exec chmod 755 {} \; && find ~/prodigasite -type f -exec chmod 644 {} \;

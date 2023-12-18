# Meu Projeto MyPetApi

Este é um projeto usando o framework Vapor.

## Pré-requisitos

- Swift (versão 5.8 ou superior)
- Docker (se desejar rodar com Docker)

## Configuração

1. Clonar o repositório:

```bash
gh repo clone backfrontacademy/devday-mypet
```

2. Abrir na raiz do projeto:

```bash
cd devday-mypet/MyPetApi
```

## Rodando localmente com Xcode

1. Abrir o projeto no Xcode:

```bash
open Package.swift
```

2. Rodar a aplicação:
   No Xcode, selecione o esquema de execução adequado e clique em "Run" ou use Cmd+R para rodar o projeto.

3. Acessar a aplicação:
   A aplicação estará disponível em <http://localhost:8080>.

## Rodando com Docker

1. Construir a imagem Docker:

```bash
docker build -t path/devday-mypet/MyPetApi .
```

2. Rodar o container Docker:

```bash
docker run -p 8080:8080 path/devday-mypet/MyPetApi
```

3. Acessar a aplicação:
    A aplicação estará disponível em <http://localhost:8080>.

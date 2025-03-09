# Scripts Curl para Teste da API Flix

Este diretório contém scripts curl para testar todos os endpoints da API Flix. Os scripts estão organizados por funcionalidade em diferentes diretórios.

## Pré-requisitos

- curl instalado
- bash shell
- API Flix rodando em `http://localhost:8080`

## Estrutura dos Scripts

```
curl-scripts/
├── auth/
│   ├── login.sh
│   └── register.sh
├── category/
│   ├── create.sh
│   ├── delete.sh
│   ├── get.sh
│   └── list.sh
├── movie/
│   ├── create.sh
│   ├── create-batch.sh
│   ├── delete.sh
│   ├── get.sh
│   ├── list.sh
│   ├── search-by-category.sh
│   └── update.sh
└── stream-service/
    ├── create.sh
    ├── delete.sh
    ├── get.sh
    └── list.sh
```

## Como Usar

### 1. Autenticação

Primeiro, registre um usuário e faça login:

```bash
# Registrar novo usuário
./auth/register.sh

# Fazer login
./auth/login.sh
```

### 2. Serviços de Streaming

Configure os serviços de streaming disponíveis:

```bash
# Criar serviço de streaming
./stream-service/create.sh
# Digite: Netflix

# Listar serviços
./stream-service/list.sh

# Buscar serviço por ID
./stream-service/get.sh 1

# Deletar serviço
./stream-service/delete.sh 1
```

### 3. Categorias

Gerencie as categorias de filmes:

```bash
# Criar categoria
./category/create.sh
# Digite: Ação

# Listar categorias
./category/list.sh

# Buscar categoria por ID
./category/get.sh 1

# Deletar categoria
./category/delete.sh 1
```

### 4. Filmes

Gerencie os filmes:

```bash
# Criar filme individual
./movie/create.sh
# Siga as instruções interativas

# Criar lote de filmes pré-definidos
./movie/create-batch.sh

# Listar todos os filmes
./movie/list.sh

# Buscar filme por ID
./movie/get.sh 1

# Buscar filmes por categoria
./movie/search-by-category.sh 1

# Atualizar filme
./movie/update.sh 1

# Deletar filme
./movie/delete.sh 1
```

## Modo Interativo vs. Parâmetros

Todos os scripts que necessitam de parâmetros podem ser usados de duas formas:

1. **Modo Interativo**: Execute o script sem parâmetros e responda às perguntas
   ```bash
   ./category/get.sh
   # Digite o ID quando solicitado
   ```

2. **Modo Direto**: Passe os parâmetros na linha de comando
   ```bash
   ./category/get.sh 1
   ```

## Script de Carga Inicial

O script `movie/create-batch.sh` cadastra uma lista pré-definida de filmes populares. Antes de executá-lo, certifique-se de que:

1. Existe pelo menos uma categoria cadastrada (ID: 1)
2. Existem os serviços de streaming cadastrados:
   - Netflix (ID: 1)
   - Apple TV+ (ID: 2)
   - Claro Video (ID: 3)

Para preparar o ambiente:

```bash
# 1. Criar categoria
./category/create.sh
# Digite: Filmes

# 2. Criar serviços de streaming
./stream-service/create.sh  # Digite: Netflix
./stream-service/create.sh  # Digite: Apple TV+
./stream-service/create.sh  # Digite: Claro Video

# 3. Executar carga de filmes
./movie/create-batch.sh
```

## Observações

- Todos os scripts incluem validação de dados obrigatórios
- Os scripts de criação/atualização solicitam todos os campos necessários
- Tokens JWT são gerados automaticamente antes de cada requisição
- As respostas da API são exibidas no formato JSON 
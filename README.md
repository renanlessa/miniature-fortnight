# API Flix

API REST para gerenciamento de catálogo de filmes e serviços de streaming, desenvolvida com Spring Boot e arquitetura moderna.

## Sobre o Projeto

O Flix é uma plataforma que permite aos usuários descobrir filmes disponíveis em diferentes serviços de streaming. O projeto foi desenvolvido com foco em:

- **Organização de Conteúdo**: Categorização eficiente de filmes
- **Múltiplos Serviços**: Integração com diversos serviços de streaming
- **Segurança**: Autenticação JWT para proteção dos endpoints
- **Performance**: Queries otimizadas e cache para melhor desempenho
- **Escalabilidade**: Arquitetura preparada para crescimento

## Arquitetura

O projeto segue uma arquitetura em camadas:

```
src/main/java/dev/flix/
├── config/         # Configurações do Spring e Security
├── controller/     # Controllers REST
├── entity/         # Entidades JPA
├── repository/     # Repositórios Spring Data
├── service/        # Regras de negócio
├── exception/      # Exceções customizadas
└── mapper/         # Conversão entre DTOs e entidades
```

## Tecnologias Utilizadas

### Backend
- **Java 17**: Versão LTS com recursos modernos da linguagem
- **Spring Boot 3**: Framework para desenvolvimento ágil
- **Spring Security**: Segurança e autenticação
- **Spring Data JPA**: Persistência de dados
- **JWT**: Tokens para autenticação stateless
- **Lombok**: Redução de boilerplate code
- **Bean Validation**: Validação de dados

### Banco de Dados
- **PostgreSQL 15**: Banco de dados relacional robusto
- **Flyway**: Migrations para controle do schema

### Ferramentas de Desenvolvimento
- **Maven**: Gerenciamento de dependências e build
- **JUnit 5**: Testes unitários
- **Mockito**: Mocking para testes
- **Swagger/OpenAPI**: Documentação da API

## Funcionalidades

### Autenticação e Autorização
- Sistema de registro e login de usuários
- Autenticação via JWT
- Proteção de rotas por perfil de usuário

### Gerenciamento de Categorias
- CRUD completo de categorias de filmes
- Validação de dados
- Tratamento de dependências

### Serviços de Streaming
- Cadastro e gestão de provedores
- Associação com filmes
- Validações de integridade

### Catálogo de Filmes
- Cadastro detalhado de filmes
- Busca por múltiplos critérios
- Associação com categorias e serviços
- Sistema de avaliação

## Pré-requisitos

- Java 17+
- PostgreSQL 15+
- Maven 3.8+
- Curl (para testes via scripts)

## Como Executar

O projeto inclui scripts para facilitar o build e a execução:

### Scripts Disponíveis

- `build.sh`: Compila o projeto e gera o arquivo JAR
- `start.sh`: Inicia a aplicação usando o JAR gerado

### Passo a Passo

1. Clone o repositório
```bash
git clone [url-do-repositorio]
```

2. Configure o banco de dados PostgreSQL no arquivo `application.properties`:
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/flix
spring.datasource.username=seu_usuario
spring.datasource.password=sua_senha
```

3. Execute o build do projeto:
```bash
./build.sh
```

4. Inicie a aplicação:
```bash
./start.sh
```

Alternativamente, você pode executar manualmente:

```bash
# Build manual
mvn clean package

# Execução manual
mvn spring-boot:run
```

A API estará disponível em `http://localhost:8080`

## Documentação da API

### Scripts de Teste

Para testar a API, foram disponibilizados scripts curl organizados por funcionalidade. 
Consulte a [documentação dos scripts](curl-scripts/README.md) para mais detalhes.

### Endpoints

#### Autenticação
- POST `/auth/register` - Registrar novo usuário
- POST `/auth/login` - Login de usuário

#### Categorias
- POST `/flix/category` - Criar categoria
- GET `/flix/category` - Listar categorias
- GET `/flix/category/{id}` - Buscar categoria por ID
- DELETE `/flix/category/{id}` - Deletar categoria

#### Serviços de Streaming
- POST `/flix/stream-service` - Criar serviço
- GET `/flix/stream-service` - Listar serviços
- GET `/flix/stream-service/{id}` - Buscar serviço por ID
- DELETE `/flix/stream-service/{id}` - Deletar serviço

#### Filmes
- POST `/flix/movie` - Criar filme
- GET `/flix/movie` - Listar filmes
- GET `/flix/movie/{id}` - Buscar filme por ID
- GET `/flix/movie/search?category={id}` - Buscar filmes por categoria
- PUT `/flix/movie` - Atualizar filme
- DELETE `/flix/movie/{id}` - Deletar filme

## Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Versionamento

Usamos [SemVer](http://semver.org/) para versionamento. Para as versões disponíveis, veja as [tags neste repositório](https://github.com/seu-usuario/flix/tags).

## Autores

* **Renan Lessa** - *Trabalho inicial*

## Licença

Este projeto está sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes. 
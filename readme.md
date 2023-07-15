# Algamoney

Este é o repositório do projeto Algamoney, que utiliza o Spring 3.2.0 e o Maven como gerenciador de dependências. O Algamoney visa realizar o gerenciamento de lançamentos financeiros.

## Instalação

1. Certifique-se de ter o Java 17 instalado em sua máquina.
2. Faça o clone deste repositório: `git clone https://github.com/tallyto/algamoney.git`
3. Acesse o diretório do projeto: `cd algamoney`
4. Execute o comando `mvn install` para compilar o projeto e baixar as dependências.

## Utilização

Após a conclusão da instalação, você pode executar o projeto usando o seguinte comando:

```
mvn spring-boot:run
```

Isso iniciará a aplicação e estará disponível no endereço `http://localhost:8080`.

## Funcionalidades

O Algamoney possui as seguintes funcionalidades principais:

- Cadastro de lançamentos financeiros.
- Consulta e busca de lançamentos.
- Cadastro de categorias.
- Gerenciamento de pessoas.

## Bibliotecas Utilizadas

O Algamoney utiliza as seguintes bibliotecas principais:

- Spring Boot Data JPA: Biblioteca para integração com o banco de dados e persistência dos dados.
- Spring Boot Web: Biblioteca para desenvolvimento de aplicações web utilizando o Spring MVC.
- Spring Boot Validation: Biblioteca para validação dos dados utilizando o Bean Validation.
- Spring Boot DevTools: Biblioteca para facilitar o desenvolvimento, fornecendo recursos como reinicialização automática da aplicação.
- Lombok: Biblioteca para redução de código boilerplate, gerando automaticamente getters, setters, construtores e outros métodos.
- MySQL Connector/J: Driver para conexão com o banco de dados MySQL.
- Flyway: Biblioteca para controle de migração de banco de dados.

## Contribuição

Se desejar contribuir para o Algamoney, siga as etapas abaixo:

1. Faça um fork deste repositório.
2. Crie uma branch para a sua feature: `git checkout -b minha-feature`
3. Faça as alterações necessárias e adicione os commits relacionados.
4. Envie um pull request para podermos revisar suas alterações.

## Histórico de Commits

- 5.5 - Validando lançamento com Bean Validation
- 5.1 - Validando inconsistências
- 5.3 - Desafio: cadastrando o primeiro lançamento
- 5.2 - Desafio: lista e busca de lançamentos
- 5.1 - Criando a migração e entidade de lançamento
- 4.4 - Implementando atualização parcial com PUT
- Atualizando pessoas com PUT
- Adicionando change log
- 4.1 - Removendo pessoa com DELETE
- 3.12 - Usando eventos para adicionar header location
- 3.11 - Desafio: criando o cadastro de pessoa
- 3.10 - Validando valores inválidos com Bean Validation
- 3.9 - Tratando erros com exception handler
- 3.8 - Validando atributos desconhecidos
- 3.7 - Desafio: retornar 404 caso não exista a categoria
- 3.6 - Cadastrando nova categoria com POST
- 3.4 - Consultando primeiro recurso com GET
- 3.3 - Migração de dados com Flyway

## Equipe

Este projeto é mantido por Tállyto ([GitHub](https://github.com/tallyto)).

## Licença

Este projeto está licenciado sob a [MIT License](https://opensource.org/licenses/MIT).
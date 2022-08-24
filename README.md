<h1 align="center">
  <img src="https://img.icons8.com/officel/30/000000/atm.png"/>
  Bank ATM - Caixa Eletrônico
</h1>

<p align="center">
  <img src="https://img.shields.io/static/v1?label=ruby&message=3.1.2&color=red&style=for-the-badge&logo=ruby" />
  <img src="https://img.shields.io/static/v1?label=ruby+on+rails&message=7.0.3&color=red&style=for-the-badge&logo=rubyonrails" />
  <img src="https://img.shields.io/static/v1?label=scov+total&message=93%&color=green&style=for-the-badge" />
  <img src="https://img.shields.io/static/v1?label=heroku&message=deployed&color=brightgreen&style=for-the-badge&logo=heroku" />
</p>

## Tópicos
* [Descrição do projeto](#descrição-do-projeto)
* [O que é possível fazer](#o-que-é-possível-fazer)
* [Deploy da aplicação com Heroku](#deploy-da-aplicação-com-heroku)
* [Pré-requisitos](#pré-requisitos)
* [Rodando a aplicação](#rodando-a-aplicação)
* [Rodando os testes](#rodando-os-testes)
* [Banco de dados](#banco-de-dados)
* [Depêndencias utilizadas](#depêndencias-utilizadas)

## Descrição do projeto
Desenvolver uma aplicação que simula as movimentações que um cliente pode fazer em um caixa eletrônico.

## O que é possível fazer
- Abrir e encerrar conta
- Editar dados de cadastro
- Realizar depósitos
- Realizar saques
- Realizar transferência entre contas
- Solicitar saldo
- Solicitar extrato

## Deploy da aplicação com Heroku
> https://arcane-chamber-93162.herokuapp.com/

## Pré-requisitos
- Ruby
- Node.js
- PostgreSQL
## Rodando a aplicação
1. No terminal, clone o projeto:
```
git clone https://github.com/fabiojrfla/bank-atm.git
```
2. Entre na pasta do projeto:
```
cd bank-atm
```
3. Instale as depêndencias:
```
bundle install
```
4. Execute as migrações:
```
rails db:migrate
```
5. Adicione dados ao banco de dados
```
rails db:seed
```
6. Execute a aplicação
```
rails server
```
Pronto, agora é possível acessar a aplicação a partir da rota http://localhost:3000/

## Rodando os testes
No terminal, execute:
```
bundle exec rspec
```

## Banco de dados
Ao rodar as seeds, são gerados os seguintes clientes:

|CPF|Nome|Senha|Dados|
| - | -- | --- | --- |
|12345678910|José|123456|Cliente sem movimentações na conta|
|10987654321|Maria|123456|Cliente com conta conta encerrada|
|65432110987|Pedro|123456|Cliente com movimentações na conta|

## Depêndencias utilizadas
- [Devise](https://github.com/heartcombo/devise)
- [Rspec](https://github.com/rspec/rspec-rails)
- [Capybara](https://github.com/teamcapybara/capybara)
- [FactoryBot](https://github.com/thoughtbot/factory_bot_rails)
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)
- [Simplecov](https://github.com/simplecov-ruby/simplecov)

Copyright :copyright: 2022 - Bank ATM

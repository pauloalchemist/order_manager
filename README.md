![Tests](https://img.shields.io/badge/Rails-6.1.4.1-red)
![Tests](https://img.shields.io/badge/Postgresql-13-blue)
[![Tests](https://github.com/pauloalchemist/order_manager/actions/workflows/ruby.yml/badge.svg)](https://github.com/pauloalchemist/order_manager/actions/workflows/ruby.yml)

# Projeto Order Manager

Projeto de gerenciador de pedidos com Ruby on Rails e Postgres.

### No projeto é utilizado:

- GithubActions para Continuous Integration (CI)
- Postgres 13 como banco de dados 

### Estrutura do Projeto

```mermaid
flowchart TD
    A[Pedido] --> B[Temos o produto?];
    B -- Sim --> C[Prossegue o pedido];
    B -- Não --> D[Interrompe o pedido];
    C ----> E[Visualização do pedido];
    D ----> F[Msg de falta para o usuário];
```

### Status do Projeto

- [x] Idealização  
    - [x] Requisitos 
    - [x] Casos de Uso
- [x] Desenvolvimento
    - [x] Testes unitários
    - [ ] Cobertura de testes
- [ ] Aplicação em produção

Aviso: Testo várias coisas nesse repositório. E sim, você encontrará inconformidades aqui.  
Aviso²: Se algo aqui te ajudar, tá valendo. Busque retribuir.   

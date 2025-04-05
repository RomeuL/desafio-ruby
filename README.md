# Sistema de Controle Bélico

Este projeto foi desenvolvido como parte do desafio para a vaga de dev da Prefeitura Municipal de Mossoró. O objetivo foi criar um sistema de controle de armas para a Guarda Civil Municipal (GCM), utilizando **Ruby on Rails**, com foco na simplicidade e produtividade.

## 🛠 Tecnologias Utilizadas

- **Ruby on Rails** (v8.0 ou superior)
- **Ruby** (v3.0 ou superior)
- **PostgreSQL** como banco de dados
- **Devise** para autenticação de usuários e gerenciamento de sessões
- **CSS puro** para estilização da interface
- **Rails Scaffold** para criação rápida de models, controllers e views

## 📌 Funcionalidades

- Autenticação de usuários com recuperação de senha
- CRUDs completos para:
  - Unidades
  - Guardas
  - Equipes
  - Armas 
- Controle de movimentações (empréstimo e devolução de armas)
  - Atualização automática de status da arma
  - Validação de devoluções com justificativa, quando necessário
- Data e hora das movimentações geradas automaticamente

## 🧠 Motivação e Decisões de Projeto

Inicialmente, considerei utilizar **Ruby on Rails apenas como back-end** com **React** no front-end, buscando maior flexibilidade visual. Também cogitei usar o **Tailwind CSS** como framework de estilização. No entanto, para manter o projeto o mais simples, acessível e focado possível, decidi seguir com **CSS puro** e a estrutura padrão do Rails.

## ✨ Experiência com Ruby on Rails

Antes deste desafio, **eu nunca havia utilizado Ruby**. Fiquei positivamente surpreso com a linguagem, especialmente quando combinada ao framework Rails. A produtividade oferecida pelas ferramentas nativas, como o `scaffold`, a extensa documentação e a comunidade ativa tornaram a experiência de desenvolvimento extremamente fluida e eficaz.

## ⚙️ Requisitos para rodar o projeto

- Ruby 3.0 ou superior
- Rails 8.0 ou superior
- PostgreSQL instalado e configurado
- Configurar as variáveis de ambiente

## 🚀 Como rodar o projeto localmente

```bash
# Clone o repositório
git clone https://github.com/RomeuL/desafio-ruby.git
cd desafio-ruby

# Instale as dependências
bundle install

# Crie e configure o banco de dados
rails db:create db:migrate

# Rode o servidor
rails server


# 🤖 Robot Framework API Automation Project

Este repositório contém testes de automação para a API ServeRest, utilizando o **Robot Framework** e a **RequestsLibrary** para cenários de testes em dispositivos móveis. A API está sendo executada localmente com o comando:

`npx serverest@latest`.

## 📂 Estrutura do Projeto

Abaixo está a árvore de diretórios que organiza os recursos, dados e casos de teste:

```
Resources
│
├── Auth
│   └── Auth.resource
├── Config
│   └── Libs.resource
├── Data
│   └── Product
│       ├── product_1.json
│       ├── product_2.json
│       └── product_template.json
│   └── Users
│       └── user_template.json
├── Hooks
│   └── Hooks.resources
├── Product
│   ├── Create_product.resource
│   ├── Delete_product.resource
│   ├── Get_product.resource
│   └── Update_product.resource
├── Users
│   ├── Create_user.resource
│   ├── Delete_user.resource
│   ├── Get_user.resource
│   └── Update_user.resource
└── Base.resource
TestCases
│
├── tests_login.robot
├── tests_product.robot
└── tests_users.robot
```

## ⚙️ Setup do Ambiente Virtual

Este projeto utiliza um ambiente virtual Python para facilitar o gerenciamento das dependências.

### 🖥️ Windows
1. Crie o ambiente virtual:

   ```bash
   python -m venv venv
   ```
3. Ative o ambiente:

   ```bash
   .\venv\Scripts\activate
   ```
4. Instale as dependências:

   ```bash
   pip install -r requirements.txt
   ```

### 🐧 Linux
1. Crie o ambiente virtual:

   ```bash
   python3 -m venv venv
   ```
3. Ative o ambiente:

   ```bash
   source venv/bin/activate
   ```
4. Instale as dependências:

   ```bash
   pip install -r requirements.txt
   ```

## 🚀 Execução dos Testes

Após configurar o ambiente, você pode executar os testes com o seguinte comando:

```bash
robot <caminho-para-os-arquivos-de-teste>
```

Exemplo:

```bash
robot TestsCases/tests_login.robot
```

## 🤝 Como Contribuir

Ficamos felizes com sua contribuição! Veja como você pode colaborar com o projeto:

1. **Fork o Repositório**:
   - Clique no botão "Fork" no canto superior direito para criar uma cópia do repositório no seu perfil.
  
2. **Clone o Repositório**:

   - Clone seu fork localmente:
     ```bash
     git clone https://github.com/CristianoSFMothe/robot-api
     ```

4. **Crie uma Branch**:
   - Crie uma nova branch para fazer suas alterações:
   
     ```bash
     git checkout -b minha-branch
     ```

5. **Commit suas Alterações**:
   - Faça commit das suas alterações:
   
     ```bash
     git commit -m "Descrição das mudanças"
     ```

6. **Envie sua Branch**:
   - Envie a branch para seu repositório forkado:
   
     ```bash
     git push origin minha-branch
     ```

7. **Crie um Pull Request**:
   - Abra um pull request no repositório original para que suas alterações sejam revisadas e integradas.


# 💳 API de Pagamento Segura com Azure ☁️

![Azure](https://img.shields.io/badge/Azure-Functions-blue?logo=azure-functions&logoColor=white)
![Bicep](https://img.shields.io/badge/Bicep-Infrastructure-blueviolet?logo=microsoft&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform&logoColor=white)
![CI/CD](https://img.shields.io/github/workflow/status/SEU_USUARIO/NOME_REPOSITORIO/Deploy%20API%20de%20Pagamento/main?label=CI%2FCD&logo=github&style=flat)

> Uma API de pagamento moderna, segura, escalável, serverless e gerenciável — powered by Azure 💙

---

## 🚀 Visão Geral

Este projeto entrega uma **API de Pagamento HTTP baseada em Azure Functions**, com:

- ✅ Camada de gerenciamento via **Azure API Management**
- 🔐 Segurança com **Subscription Keys + JWT + Key Vault**
- 💾 Armazenamento de logs e segredos com Azure
- ☁️ Deploy com **Bicep**, **Terraform** ou **GitHub Actions**
- 📜 Documentação OpenAPI (`openapi.yaml`)

---

## 🧱 Estrutura do Projeto

```plaintext
api-pagamento-azure/
├── backend/
│   └── payment-api/         # Azure Function App (Python)
│       ├── main.py
│       ├── function.json
│       ├── payment_service.py
│       ├── requirements.txt
│       └── shared/
│           ├── utils.py
│           └── validators.py
├── api-spec/
│   └── openapi.yaml         # Especificação da API
├── infrastructure/
│   ├── bicep/               # Deploy com Bicep
│   │   └── main.bicep
│   └── terraform/           # Deploy com Terraform
│       └── main.tf
├── .github/workflows/
│   └── deploy-api.yml       # GitHub Actions para CI/CD
└── README.md

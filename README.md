# 💰 FinForce Lending

**FinForce Lending** é um projeto de estudo e portfólio desenvolvido para demonstrar minhas habilidades na construção de um **motor de originação de crédito**, utilizando a plataforma Salesforce.

O sistema permite que o usuário simule valores de crédito e receba **propostas personalizadas**, calculadas com base em regras de risco e matemática financeira.

---

## 🎯 Objetivo do Projeto

* Aplicar conceitos de **arquitetura Salesforce** em um cenário realista do mercado financeiro
* Desenvolver regras de **avaliação de risco** e **cálculo financeiro**
* Criar uma experiência de simulação intuitiva para o usuário final
* Consolidar conhecimentos em **Apex, OmniStudio e LWC**

---
## 🗃️ Documentação Técnica

https://dramatic-vole-6c8.notion.site/Documenta-o-T-cnica-FinForce-Lending-2e3f1f9a0864800aaaf2f2769e7f8a38

---

## 🧱 Arquitetura & Stack Tecnológica

### 🗄️ Modelagem de Dados

* Modelagem relacional entre **Solicitação de Crédito** e **Propostas**
* Estrutura pensada para suportar múltiplas propostas por solicitação

### ⚙️ Apex

* Implementação de **matemática financeira**

  * Cálculo de parcelas
  * Cálculo de juros
* Desenvolvimento de uma **Engine de Risco**

  * Regras de aprovação
  * Classificação de perfil do cliente

### 🔗 OmniStudio

* **Integration Procedures**

  * Orquestração da comunicação entre o front-end e o back-end
  * Foco em performance e reutilização
* **DataRaptors**

  * Leitura e persistência de dados
  * Redução de lógica no LWC

### 🎨 Lightning Web Components (LWC)

* Interface rica e interativa
* Uso de componentes como:

  * Sliders para simulação de valores
  * Gráficos para visualização das propostas
* Comunicação com o back-end via Integration Procedures

---

## 🚀 Aprendizados e Destaques

* Boas práticas de separação de responsabilidades
* Uso estratégico do OmniStudio para reduzir acoplamento
* Construção de lógica de negócio complexa em Apex
* Criação de interfaces modernas no Salesforce com LWC

---

## 👩‍💻 Sobre o Projeto

Este projeto faz parte do meu **portfólio pessoal** e foi desenvolvido com foco em aprendizado prático, simulando um cenário real de mercado no setor financeiro.

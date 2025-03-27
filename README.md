# AWS WordPress Terraform

Este repositório contém a configuração de infraestrutura como código (IaC) para provisionar um ambiente WordPress na AWS utilizando Terraform e Docker.

## Estrutura do Projeto

- **Terraform**: Scripts para criar a infraestrutura na AWS.
- **EC2 + Docker**: Instância EC2 configurada via User Data para rodar o WordPress dentro de um container.
- **RDS**: Banco de dados MySQL gerenciado na AWS.
- **Security Groups**: Controle de acesso à rede.
- **S3 (Opcional)**: Armazenamento para arquivos estáticos.

## Como Usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/teu-usuario/aws-wp-tf.git
   cd aws-wp-tf

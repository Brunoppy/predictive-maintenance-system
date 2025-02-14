# Sistema de Manutenção Preditiva 

## 📌 Descrição
Este projeto permite prever falhas em equipamentos por meio da análise de dados históricos e padrões que indicam possíveis problemas antes que aconteçam.

## 📂 Estrutura do Banco de Dados
| Nome da Tabela         | Descrição |
|------------------------|------------|
| `equipamentos`        | Armazena informações sobre equipamentos monitorados. |
| `historico_manutencao` | Registra manutenções realizadas. |
| `falhas`              | Registra falhas em equipamentos. |
| `modelos_preditivos`  | Armazena previsões de falhas futuras. |

## 🔍 Principais Consultas SQL
| Objetivo da Consulta             | Comando SQL |
|----------------------------------|-------------|
| Identificar equipamentos de alto risco | `SELECT nome, data_falha_prevista FROM modelos_preditivos WHERE nivel_confianca > 85 ORDER BY data_falha_prevista;` |

## 🚀 Como Usar
1. Execute o script SQL para criar o banco de dados.
2. Insira dados de exemplo nas tabelas.
3. Utilize as consultas para analisar necessidades de manutenção e prever falhas.

## 📤 Como Enviar para o GitHub
```bash
cd caminho/do/projeto
git init
git add .
git commit -m "Adicionado Sistema de Manutenção Preditiva"
git remote add origin https://github.com/SeuUsuario/SeuRepositorio.git
git push -u origin main

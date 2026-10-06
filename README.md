# E-commerce Sales Analytics

> Um projeto de análise de dados de ponta a ponta que transforma dados transacionais de e-commerce em insights de negócio acionáveis por meio de data profiling, análise em SQL, Google BigQuery e um dashboard executivo de vendas.

---

## Prévia do Dashboard

![E-commerce Sales Dashboard](Ativos/Dashboard/executive_sales_dashboard.png)

> **Executive Sales Dashboard** — uma visão consolidada de receita, volume de pedidos, desempenho de produtos e desempenho de mercados geográficos.

**[Abrir o Dashboard Interativo](https://cassio-bressan.github.io/ecommerce-sales-analytics/)**

---

## Visão Geral do Projeto

Este projeto apresenta uma **solução de análise de vendas de e-commerce** de ponta a ponta, desenvolvida para transformar dados transacionais em informações de negócio confiáveis e insights de apoio à decisão.

O projeto cobre todo o fluxo analítico, desde o **data profiling e a validação da qualidade dos dados** até a criação de uma camada analítica no **Google BigQuery**, a análise de negócio baseada em SQL e o desenvolvimento de um dashboard executivo.

Em vez de focar apenas na visualização, o projeto foi estruturado em torno de **perguntas de negócio** claramente definidas, relacionadas ao crescimento da receita, ao desempenho de produtos e ao desempenho de mercados.

O resultado final é um fluxo analítico que conecta qualidade de dados, análise em SQL e visualização orientada ao negócio em um único projeto de portfólio.

---

## Problema de Negócio

Operações de e-commerce geram grandes volumes de dados transacionais, mas os registros brutos de transações, por si só, não oferecem uma visão eficiente do desempenho geral do negócio.

Os tomadores de decisão precisam entender como a receita está evoluindo, quais produtos e categorias mais contribuem para as vendas e como o desempenho varia entre diferentes mercados geográficos.

O desafio abordado por este projeto foi, portanto, transformar dados transacionais de e-commerce em uma **camada analítica confiável e uma visão executiva do desempenho de vendas**.

### Principais Necessidades de Negócio

* Monitorar o desempenho da receita ao longo do tempo
* Acompanhar o volume de pedidos concluídos
* Avaliar o ticket médio
* Identificar as categorias que geram mais receita
* Identificar os produtos que geram mais receita
* Comparar o desempenho de receita entre países
* Analisar o ticket médio em diferentes mercados
* Fornecer um dashboard consolidado para análise em nível executivo

---

## Objetivos do Projeto

O projeto foi desenvolvido com os seguintes objetivos:

* Construir uma camada analítica estruturada a partir de dados transacionais de e-commerce
* Realizar data profiling antes da análise de negócio
* Validar a qualidade e a consistência dos dados
* Desenvolver métricas de negócio em SQL usando o Google BigQuery
* Analisar o desempenho de vendas por tempo, produtos e mercados geográficos
* Traduzir os resultados analíticos em um dashboard voltado para executivos
* Organizar todo o processo analítico em um projeto de portfólio reproduzível

---

# Dataset

O projeto é baseado no dataset público The Look E-commerce, disponibilizado por meio do Google BigQuery.

O dataset simula um negócio de e-commerce e contém informações sobre clientes, pedidos, produtos, itens de pedido e outros dados transacionais relacionados.

Os dados foram organizados em uma view analítica chamada `vw_sales`, armazenada no dataset `analytics` dentro do Google BigQuery.

### Visão Geral do Dataset

| Atributo                       | Descrição                                |
| ------------------------------ | ---------------------------------------- |
| Plataforma                     | Google BigQuery                          |
| Dataset                        | `analytics`                              |
| View Analítica                 | `vw_sales`                               |
| Medida Principal               | `sale_price`                             |
| Identificador da Transação     | `order_id`                               |
| Identificador do Produto       | `product_id`                             |
| Identificador do Cliente       | `user_id`                                |
| Status do Pedido               | `status`                                 |
| Dimensão Temporal              | `year_month`                             |
| Dimensão de Produto            | `category`, `product_name`, `department` |
| Dimensão Geográfica            | `country`, `state`, `city`               |

A view analítica fornece os campos necessários para realizar a análise de negócio e construir o dashboard.

### Cobertura dos Dados

O dataset cobre vários anos de atividade de e-commerce e inclui transações em diversos países e categorias de produtos.

Para a análise de negócio apresentada no dashboard, os **pedidos concluídos (`status = 'Complete'`)** são utilizados como base para os cálculos de receita, pedidos e ticket médio.

---

# Fluxo de Análise

O projeto segue um fluxo analítico estruturado:

```text
Dados Transacionais de E-commerce
            │
            ▼
      Data Profiling
            │
            ▼
Validação da Qualidade dos Dados
            │
            ▼
      Camada Analítica
        `vw_sales`
            │
            ▼
        Análise SQL
            │
            ▼
    Métricas de Negócio
            │
            ▼
    Dashboard Executivo
```

### 1. Data Profiling

O dataset foi inspecionado para compreender sua estrutura, os campos disponíveis, os tipos de dados, a cobertura temporal e possíveis problemas de qualidade dos dados.

A etapa de profiling forneceu a base para a validação e a análise subsequentes.

### 2. Validação da Qualidade dos Dados

Verificações de qualidade dos dados foram realizadas antes de utilizar o dataset na análise de negócio.

O processo de validação incluiu verificações relacionadas a:

* Contagem de registros
* Valores ausentes
* Registros duplicados
* Campos numéricos
* Cobertura temporal
* Integridade referencial
* Consistência entre datasets relacionados

### 3. Camada Analítica

A view analítica `vw_sales` foi criada para fornecer uma representação estruturada e pronta para análise dos dados de e-commerce.

Essa camada consolida os campos necessários para as perguntas de negócio e para as métricas do dashboard.

### 4. Análise de Negócio em SQL

Consultas SQL foram desenvolvidas no BigQuery para calcular as métricas utilizadas ao longo do projeto.

A análise foca exclusivamente nas perguntas de negócio definidas e não introduz indicadores não relacionados.

### 5. Desenvolvimento do Dashboard

Os resultados analíticos foram transformados em um dashboard executivo, projetado para oferecer uma visão concisa do desempenho de vendas.

---

# Perguntas de Negócio

O dashboard foi projetado em torno de quatro áreas analíticas.

## Visão Geral Executiva

O dashboard apresenta três KPIs de alto nível:

### Receita Total

Qual é a receita total gerada pelos pedidos concluídos?

### Total de Pedidos

Quantos pedidos concluídos distintos foram gerados?

### Ticket Médio

Qual é a receita média gerada por pedido concluído?

---

## Crescimento do Negócio

### Tendência da Receita Mensal

Como a receita evolui ao longo do tempo?

### Tendência de Pedidos Mensais

Como o volume de pedidos concluídos evolui ao longo do tempo?

Essas análises fornecem uma visão de alto nível da evolução do desempenho de vendas.

---

## Desempenho de Produtos

### Receita por Categoria

Quais categorias de produtos geram a maior receita?

### Principais Produtos por Receita

Quais produtos individuais geram a maior receita?

Essas análises ajudam a identificar os produtos e categorias que mais contribuem para o desempenho geral de vendas.

---

## Desempenho de Mercado

### Receita por País

Quais países geram a maior receita?

### Ticket Médio por País

Como o valor médio dos pedidos varia entre os diferentes países?

Essas análises fornecem uma perspectiva geográfica do desempenho de vendas.

---

# Métricas de Negócio

As métricas do dashboard foram definidas usando as seguintes regras de negócio.

### Receita Total

```sql
SUM(sale_price)
```

filtrada por:

```sql
status = 'Complete'
```

### Total de Pedidos

```sql
COUNT(DISTINCT order_id)
```

filtrado por:

```sql
status = 'Complete'
```

### Ticket Médio

```sql
SUM(sale_price) / COUNT(DISTINCT order_id)
```

filtrado por:

```sql
status = 'Complete'
```

### Receita por Categoria

```sql
SUM(sale_price)
```

agrupada por:

```sql
category
```

e filtrada para pedidos concluídos.

### Principais Produtos por Receita

```sql
SUM(sale_price)
```

agrupada por:

```sql
product_name
```

com a análise restrita aos 10 principais produtos por receita.

### Receita por País

```sql
SUM(sale_price)
```

agrupada por:

```sql
country
```

e filtrada para pedidos concluídos.

### Ticket Médio por País

```sql
SUM(sale_price) / COUNT(DISTINCT order_id)
```

agrupado por:

```sql
country
```

e filtrado para pedidos concluídos.

### Receita Mensal

```sql
SUM(sale_price)
```

agrupada por:

```sql
year_month
```

e filtrada para pedidos concluídos.

### Pedidos Mensais

```sql
COUNT(DISTINCT order_id)
```

agrupados por:

```sql
year_month
```

e filtrados para pedidos concluídos.

---

# Dashboard

O dashboard final está organizado em três seções analíticas.

## Visão Geral Executiva

Os KPIs de nível superior fornecem um panorama conciso de:

* Receita Total
* Total de Pedidos
* Ticket Médio

---

## Crescimento do Negócio

| Análise                    | Visualização     |
| -------------------------- | ---------------- |
| Tendência da Receita Mensal | Gráfico de Linha |
| Tendência de Pedidos Mensais | Gráfico de Linha |

Essas visualizações permitem identificar mudanças na receita de vendas e no volume de pedidos ao longo do tempo.

---

## Desempenho de Produtos

| Análise                          | Visualização                |
| -------------------------------- | --------------------------- |
| Receita por Categoria            | Gráfico de Barras Horizontais |
| Principais Produtos por Receita  | Gráfico de Barras Horizontais |

Essas visualizações destacam as categorias e os produtos que mais contribuem para a receita.

---

## Desempenho de Mercado

| Análise                | Visualização                  |
| ---------------------- | ----------------------------- |
| Receita por País       | Mapa Geográfico               |
| Ticket Médio por País  | Gráfico de Barras Horizontais |

Essas visualizações fornecem uma perspectiva geográfica tanto da concentração de receita quanto do comportamento do ticket médio.

---

# Principais Insights

O dashboard foi projetado para apoiar diversos tipos de interpretação de negócio.

### Desempenho da Receita

A análise da receita mensal permite que os tomadores de decisão identifiquem períodos de maior e menor desempenho de vendas e observem a evolução geral da receita.

### Desempenho de Produtos

A receita por categoria e o ranking dos principais produtos revelam onde a receita de vendas está concentrada no portfólio de produtos.

### Desempenho Geográfico

A análise de receita por país destaca os mercados que mais contribuem para a receita total.

### Valor do Cliente por Mercado

O ticket médio por país oferece uma perspectiva complementar à receita total, ajudando a distinguir mercados com alta receita geral de mercados com maior valor médio de pedido.

> **Nota:** O dashboard é uma ferramenta de apoio à decisão. As métricas individuais devem ser interpretadas em conjunto, e não isoladamente.

---

# Tecnologias

O projeto utiliza as seguintes tecnologias e ferramentas:

| Tecnologia          | Finalidade                                                                  |
| ------------------- | --------------------------------------------------------------------------- |
| **Google BigQuery** | Armazenamento de dados, camada analítica, análise em SQL e validação        |
| **SQL**             | Data profiling, validação, transformação e análise de negócio               |
| **Claude AI**       | Criação do dashboard                                                        |
| **Git / GitHub**    | Controle de versão e documentação do projeto                                |

---

# Estrutura do Projeto

```text
E-commerce Sales Analytics
│
├── Ativos/
│   ├── Dashboard/
│   │   └── ...
│   │
│   ├── Diagramas/
│   │   └── Data_schema.png
│   │
│   └── Evidencias/
│       ├── 01_project_dataset.png
│       ├── 02_analytical_view.png
│       ├── 03_sql_query.png
│       └── 04_validation.png
│
├── Consultas/
│   └── ...
│
├── Documentos/
│   ├── business_context.md
│   ├── data_model.md
│   ├── data_profiling.md
│   ├── ...
│   └── ...
│
└── README.md
```

> A estrutura acima separa o trabalho analítico, a documentação do projeto, os ativos visuais e as evidências técnicas, para manter o repositório organizado e reproduzível.

---

# Documentação

O repositório contém documentação de apoio que cobre as principais etapas do projeto.

### Contexto de Negócio

Descreve o cenário de negócio, os objetivos e as perguntas analíticas que guiaram o projeto.

**[Ver Contexto de Negócio](Documentos/business_context.md)**

### Modelo de Dados

Documenta a estrutura e os relacionamentos dos dados analíticos.

**[Ver Modelo de Dados](Documentos/data_model.md)**

### Data Profiling

Documenta a inspeção inicial e o profiling do dataset.

**[Ver Data Profiling](Documentos/data_profiling.md)**

### Camada Analítica

Documenta a camada analítica e a construção da `vw_sales`.

**[Ver Camada Analítica](Documentos/analytical_layer.md)**

---

# Evidências Técnicas

O repositório também contém capturas de tela que documentam a implementação técnica no Google BigQuery.

### Projeto e Dataset

`01_project_dataset.png`

Demonstra o projeto no BigQuery, o dataset e a localização da view analítica.

### View Analítica

`02_analytical_view.png`

Mostra o schema da `vw_sales`, incluindo os campos e os tipos de dados utilizados ao longo da análise.

### Definição da Camada Analítica

`03_vw_sales_definition.png`

Mostra o código SQL usado para criar a camada analítica `vw_sales`.

### Análise SQL

`04_sql_query.png`

Mostra uma consulta de negócio representativa executada na `vw_sales` e seu resultado.

### Validação dos Dados

`05_validation.png`

Mostra uma consulta representativa de validação da qualidade dos dados e seus resultados.

Essas evidências fornecem um registro visual do ambiente analítico e demonstram como a análise de negócio foi realizada no BigQuery.

---

# Abordagem Analítica

Um princípio fundamental ao longo do projeto foi separar **preparação dos dados, lógica analítica e visualização**.

O dashboard não opera diretamente sobre um dataset transacional não estruturado.

Em vez disso, o fluxo segue:

```text
Dados Transacionais
       ↓
Validação dos Dados
       ↓
View Analítica
       ↓
Lógica de Negócio
       ↓
Métricas SQL
       ↓
Dashboard
```

Essa separação melhora a transparência, a manutenibilidade e a reprodutibilidade da análise.

---

# Conclusão

Este projeto demonstra um **fluxo de análise de dados de ponta a ponta aplicado a um contexto de negócio de e-commerce**.

Partindo de dados transacionais, o projeto avança por data profiling, validação de qualidade, modelagem analítica, análise de negócio baseada em SQL e visualização executiva.

O dashboard final fornece uma visão consolidada do desempenho da receita, do volume de pedidos, do desempenho de produtos e do desempenho de mercados geográficos, traduzindo os dados subjacentes em um formato adequado para análise de negócio e apoio à decisão.

O projeto também documenta o processo técnico por trás da análise, permitindo que o raciocínio analítico, a lógica SQL e as etapas de validação de dados sejam revisados de forma independente.

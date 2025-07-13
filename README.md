# Data Wrangling Project - Docker Setup

Este projeto utiliza Docker para criar um ambiente consistente de desenvolvimento com Jupyter Notebook e todas as dependências necessárias.

## Pré-requisitos

- Docker instalado
- Docker Compose instalado

## Como usar

### Opção 1: Usando Docker Compose (Recomendado)

1. **Construir e iniciar o container:**
   ```bash
   docker-compose up --build
   ```

2. **Acessar o Jupyter Notebook:**
   - Abra seu navegador e vá para: `http://localhost:8888`
   - O Jupyter será iniciado sem senha/token para facilitar o desenvolvimento

3. **Parar o container:**
   ```bash
   docker-compose down
   ```

### Opção 2: Usando Docker diretamente

1. **Construir a imagem:**
   ```bash
   docker build -t data-wrangling .
   ```

2. **Executar o container:**
   ```bash
   docker run -p 8888:8888 -v $(pwd):/home/jovyan/work data-wrangling
   ```

## Estrutura do Projeto

- `Dockerfile` - Configuração da imagem Docker
- `docker-compose.yml` - Configuração do Docker Compose
- `requirements.txt` - Dependências Python
- `*.ipynb` - Notebooks Jupyter
- `*.csv`, `*.tsv` - Arquivos de dados
- `twitter-api.py` - Script da API do Twitter

## Dependências Incluídas

- pandas - Manipulação de dados
- numpy - Computação numérica
- requests - Requisições HTTP
- tweepy - API do Twitter
- matplotlib - Visualizações
- seaborn - Visualizações estatísticas
- jupyter - Ambiente Jupyter
- scipy - Funções científicas
- plotly - Visualizações interativas

## Notas

- Todos os arquivos do projeto são montados no container via volume
- As modificações nos notebooks são salvas automaticamente no seu sistema local
- O container usa a imagem `jupyter/scipy-notebook` que já vem com muitas bibliotecas científicas pré-instaladas

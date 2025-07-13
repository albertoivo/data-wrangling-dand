# Use a imagem oficial do Python com Jupyter
FROM jupyter/scipy-notebook:latest

# Definir o usuário como root para instalar dependências
USER root

# Atualizar o sistema e instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Voltar para o usuário jovyan (padrão do Jupyter)
USER $NB_UID

# Copiar o arquivo de requirements
COPY requirements.txt /tmp/requirements.txt

# Instalar as dependências Python
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Criar diretório de trabalho
WORKDIR /home/jovyan/work

# Expor a porta padrão do Jupyter
EXPOSE 8888

# Comando padrão para iniciar o Jupyter Notebook
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.allow_root=True"]

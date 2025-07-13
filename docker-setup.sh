#!/bin/bash

# Script para facilitar o uso do Docker no projeto

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🐳 Data Wrangling Project - Docker Setup${NC}"
echo ""

# Verificar se Docker está instalado
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker não está instalado!${NC}"
    echo "Por favor, instale o Docker: https://docs.docker.com/get-docker/"
    exit 1
fi

# Verificar se Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}❌ Docker Compose não está instalado!${NC}"
    echo "Por favor, instale o Docker Compose: https://docs.docker.com/compose/install/"
    exit 1
fi

echo -e "${GREEN}✅ Docker e Docker Compose encontrados!${NC}"
echo ""

# Função para construir e iniciar
start_jupyter() {
    echo -e "${YELLOW}🔨 Construindo a imagem Docker...${NC}"
    docker-compose build
    
    echo -e "${YELLOW}🚀 Iniciando o Jupyter Notebook...${NC}"
    docker-compose up -d
    
    echo ""
    echo -e "${GREEN}✅ Jupyter Notebook está rodando!${NC}"
    echo -e "${GREEN}📂 Acesse: http://localhost:8888${NC}"
    echo ""
    echo "Para parar o container, execute: ./docker-setup.sh stop"
}

# Função para parar
stop_jupyter() {
    echo -e "${YELLOW}🛑 Parando o Jupyter Notebook...${NC}"
    docker-compose down
    echo -e "${GREEN}✅ Container parado!${NC}"
}

# Função para logs
show_logs() {
    echo -e "${YELLOW}📋 Mostrando logs do container...${NC}"
    docker-compose logs -f
}

# Função para status
show_status() {
    echo -e "${YELLOW}📊 Status dos containers:${NC}"
    docker-compose ps
}

# Menu de opções
case "${1}" in
    "start" | "")
        start_jupyter
        ;;
    "stop")
        stop_jupyter
        ;;
    "restart")
        stop_jupyter
        start_jupyter
        ;;
    "logs")
        show_logs
        ;;
    "status")
        show_status
        ;;
    "help")
        echo "Uso: $0 [comando]"
        echo ""
        echo "Comandos disponíveis:"
        echo "  start    - Construir e iniciar o Jupyter Notebook (padrão)"
        echo "  stop     - Parar o container"
        echo "  restart  - Reiniciar o container"
        echo "  logs     - Mostrar logs do container"
        echo "  status   - Mostrar status dos containers"
        echo "  help     - Mostrar esta ajuda"
        ;;
    *)
        echo -e "${RED}❌ Comando inválido: $1${NC}"
        echo "Use '$0 help' para ver os comandos disponíveis."
        exit 1
        ;;
esac

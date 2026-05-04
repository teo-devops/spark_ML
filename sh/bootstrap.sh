#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

echo -e "${GREEN}🚀 Iniciando orquestador de infraestructura Spark ML...${NC}"

# 1. Garantizar existencia de .env
if [ ! -f ".env" ]; then
    echo -e "${YELLOW}i️  No se encontró .env, creando desde plantilla...${NC}"
    cp .env.template .env
fi

# Función para obtener/pedir secretos
get_secret() {
    local var_name=$1
    local prompt_msg=$2
    local current_val=$(grep "^${var_name}=" .env | cut -d '=' -f2)

    if [ -z "$current_val" ]; then
        echo -e "${YELLOW}❓ $prompt_msg${NC}"
        read -s -p "> " user_input
        echo ""
        # Actualizar .env (usando un delimitador alternativo para rutas)
        sed -i "s|^${var_name}=.*|${var_name}=${user_input}|" .env
    fi
}

# 2. Validación Interactiva de Secretos
get_secret "MYSQL_ROOT_PASSWORD" "Introduce el Password Root para MariaDB:"
get_secret "MYSQL_PASSWORD" "Introduce el Password para el usuario Hive:"
get_secret "GCP_KEY_LOCAL" "Introduce la ruta LOCAL absoluta de tu gcp-key.json (ej: /home/user/keys/key.json):"

# 3. Validar si el archivo de GCP existe realmente
GCP_PATH=$(grep "^GCP_KEY_LOCAL=" .env | cut -d '=' -f2)
if [ ! -f "$GCP_PATH" ]; then
    echo -e "${RED}❌ ERROR: El archivo de llave GCP no existe en: $GCP_PATH${NC}"
    echo -e "${YELLOW}Por favor, corrige la ruta en el archivo .env${NC}"
    exit 1
fi

# 4. Preparar entorno de persistencia
echo -e "${GREEN}📁 Validando directorios de trabajo...${NC}"
dirs=("data" "labs" "src" "secrets" "spark-events" "mlflow_data")
for dir in "${dirs[@]}"; do
    mkdir -p "$dir"
done

# 5. Ajustar permisos
chmod -R 777 spark-events mlflow_data

# 6. Detectar comando docker compose
if docker compose version > /dev/null 2>&1; then
    DOCKER_COMPOSE_CMD="docker compose"
elif docker-compose version > /dev/null 2>&1; then
    DOCKER_COMPOSE_CMD="docker-compose"
else
    echo -e "${RED}❌ ERROR: No se encontró 'docker compose' ni 'docker-compose'.${NC}"
    exit 1
fi

# 7. Lanzamiento
echo -e "${GREEN}🐳 Levantando servicios con $DOCKER_COMPOSE_CMD...${NC}"
$DOCKER_COMPOSE_CMD up -d

echo -e "\n${GREEN}✅ Sistema listo.${NC}"
echo "-------------------------------------------------------"
echo "URL Jupyter: http://localhost:8888 (Token: $(grep JUPYTER_TOKEN .env | cut -d '=' -f2))"
echo "-------------------------------------------------------"

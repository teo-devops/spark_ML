FROM quay.io/jupyter/pytorch-notebook:python-3.11

USER root

# Instalación de dependencias de sistema para conectores y optimización
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    openjdk-17-jre-headless \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalación de librerías de IA y BigData pre-baked
# Apache Arrow es clave para la sinergia Spark-Pandas
RUN pip install --no-cache-dir \
    pyspark==3.5.1 \
    mlflow==2.11.3 \
    transformers[torch] \
    google-cloud-bigquery-storage \
    pyarrow \
    boto3 \
    mysql-connector-python

# Configuración de permisos para el usuario jovyan
RUN chown -R jovyan:users /home/jovyan/work

USER jovyan
WORKDIR /home/jovyan/work

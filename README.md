# ⚡ Spark ML & AI Distributed Laboratory

[![Spark](https://img.shields.io/badge/Spark-3.5.1-E25A1C?logo=apachespark&logoColor=white)](https://spark.apache.org/)
[![MLflow](https://img.shields.io/badge/MLflow-2.11.3-0194E2?logo=mlflow&logoColor=white)](https://mlflow.org/)
[![Python](https://img.shields.io/badge/Python-3.11-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)

A professional, containerized environment for Distributed Data Science and Machine Learning. Designed for high-performance model training, LLM experimentation, and experiment tracking.

## 🚀 Quick Start

1. **Clone the repository**
2. **Launch the Bootstrap script**:
   ```bash
   ./sh/bootstrap.sh
   ```
   *This script will handle dependencies, environment variables, and start the Docker cluster.*

## 🏗️ Arquitectura y Componentes

El laboratorio está diseñado siguiendo principios de **Single Responsibility**, asegurando que cada servicio cumpla un rol específico y escalable:

| Componente | Función | Justificación |
| :--- | :--- | :--- |
| **Spark Master** | Coordinador del Cluster | Gestiona la distribución de tareas y recursos entre los workers. |
| **Spark Workers (x2)** | Nodos de Cómputo | Ejecutan el procesamiento pesado de datos de forma paralela. |
| **Jupyter Lab** | Entorno de Desarrollo | Interfaz interactiva pre-configurada con Spark, PyTorch y MLflow. |
| **MLflow Server** | Tracking de Experimentos | Registro centralizado de parámetros, métricas y modelos de ML. |
| **Hive Metastore** | Catálogo de Datos | Permite que todos los nodos del cluster compartan las mismas tablas y esquemas. |
| **MariaDB (DB)** | Persistencia de Metadata | Base de datos relacional para el almacenamiento persistente del catálogo Hive. |
| **History Server** | Análisis Post-Mortem | Permite auditar y optimizar jobs de Spark una vez han finalizado. |
| **Jar Downloader** | Gestor de Dependencias | Automatiza la descarga de conectores críticos (MySQL, BigQuery) al iniciar. |

## 🌐 Access Points

| Service | Local URL | Description |
| :--- | :--- | :--- |
| **Jupyter Lab** | [http://localhost:8888](http://localhost:8888) | Dev environment (Token: `spark123`) |
| **Spark Master UI** | [http://localhost:8080](http://localhost:8080) | Cluster monitoring & workers status |
| **MLflow UI** | [http://localhost:5000](http://localhost:5000) | Experiment tracking & model comparison |
| **Spark History** | [http://localhost:18080](http://localhost:18080) | Analysis of completed Spark jobs |

## 🛠️ Features

- **Distributed LLM Inference**: Optimized for Hugging Face Transformers using Pandas UDFs and Apache Arrow.
- **Automated Secrets**: Secure handling of GCP keys and database passwords via `.env`.
- **Shared Artifacts**: Custom shared volume architecture to allow distributed logging of models to MLflow from any node.
- **BigQuery Integration**: Native connector pre-installed and configured.

## 📁 Project Structure

```text
.
├── config/           # Service configurations (Spark, Hive)
├── data/             # Local datasets
├── docker/           # Custom Dockerfiles
├── labs/             # Jupyter Notebooks (Main workspace)
├── mlflow_data/      # MLflow experiments and artifacts
├── secrets/          # Private keys (GCP)
├── sh/               # Infrastructure scripts
└── src/              # Production source code
```

---
*Built for Advanced Data Science Workflows.*

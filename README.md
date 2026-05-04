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

## 🏗️ Architecture

The cluster consists of:
- **Spark Master**: Central coordinator for distributed tasks.
- **Spark Workers (x2)**: 2 nodes for parallel data processing.
- **Jupyter Lab**: Pre-configured with PyTorch, Spark, and BigQuery support.
- **MLflow Server**: Centralized experiment tracking and model registry.
- **Hive Metastore**: Persistent metadata management for Spark SQL.

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

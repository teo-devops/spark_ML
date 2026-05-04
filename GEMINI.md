# GEMINI Context: Spark ML & AI Distributed Laboratory

This project provides a professional-grade, containerized environment for Distributed Data Science and Machine Learning. It integrates **Apache Spark 3.5.1**, **MLflow**, and **Hugging Face Transformers** into a cohesive ecosystem.

## 🏗️ Architecture & Responsibility
The project follows the principle of single responsibility:

- **`config/`**: Centralized service configurations (`spark/`, `hive/`).
- **`docker/`**: Custom container definitions (Jupyter with PyTorch/Spark support).
- **`labs/`**: Development workspace for Jupyter Notebooks.
- **`sh/`**: Orchestration and infrastructure management scripts.
- **`data/` / `src/`**: Data assets and production source code.
- **`secrets/`**: Local storage for sensitive keys (e.g., GCP JSON keys).
- **`mlflow_data/`**: Persistent storage for MLflow experiments and shared artifact repository.

## 🚀 Professional Workflow (Bootstrap)
The environment is **environment-agnostic** and uses an intelligent bootstrap process to handle secrets and dependencies safely.

1.  **Initialize the Environment**:
    ```bash
    ./sh/bootstrap.sh
    ```
    - **Auto-Detection**: Supports both `docker compose` (V2) and `docker-compose` (V1).
    - **Config Injection**: Automatically creates `.env` from template and prompts for missing secrets.
    - **Permission Sync**: Ensures directories like `mlflow_data` and `spark-events` have correct RW permissions across containers.
    - **Resilient Healthchecks**: Spark Master uses internal socket checks to ensure cluster readiness before workers attach.

2.  **Secret Management**:
    - Credentials are kept in `.env` (ignored by git).
    - GCP authentication is handled via `GOOGLE_APPLICATION_CREDENTIALS`, automatically mounted and injected into all cluster nodes.

## 🛠️ Technical Specifications
- **Spark Cluster**: 1 Master + 2 Workers (Configured for 2GB RAM / 2 Cores each).
- **Shared Artifact Store**: A shared volume mounted at `/mlflow` across all nodes allows Spark executors to log models directly to the MLflow repository, preventing "Permission Denied" errors in distributed tracking.
- **AI/LLM Optimization**:
  - **Apache Arrow**: Enabled for high-performance Pandas UDFs.
  - **Kryo Serialization**: Optimized for broadcasting large model tensors and ML metadata.
- **Tracking**: Integrated **MLflow** server (`http://mlflow:5000`) with SQLite backend and local artifact storage.
- **Data Ingestion**: Native **BigQuery** support via the pre-configured Spark connector and automated jar downloading.

## 🌐 Access Points
- **Jupyter Lab**: `http://localhost:8888` (Token: `spark123`)
- **Spark Master UI**: `http://localhost:8080`
- **MLflow UI**: `http://localhost:5000`
- **Spark History Server**: `http://localhost:18080`

## 📝 Development Conventions
- Place all new notebooks in the `labs/` directory.
- Use **MLflow** for tracking any baseline vs. LLM comparisons.
- Leverage the **Pandas UDFs** with Arrow for distributed LLM inference.
- Keep the `.env.template` updated if new configuration variables are introduced.

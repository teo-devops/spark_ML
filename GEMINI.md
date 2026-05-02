# GEMINI Context: Spark ML & AI Distributed Laboratory

This project provides a professional-grade, containerized environment for Distributed Data Science and Machine Learning. It integrates **Apache Spark 3.5.1**, **MLflow**, and **Hugging Face Transformers** into a cohesive ecosystem.

## 🏗️ Architecture & Responsibility
The project follows the principle of single responsibility:

- **`config/`**: Centralized service configurations (`spark/`, `hive/`).
- **`docker/`**: Custom container definitions and Dockerfiles.
- **`labs/`**: Development workspace for Jupyter Notebooks.
- **`sh/`**: Orchestration and infrastructure management scripts.
- **`data/` / `src/`**: Data assets and production source code.
- **`secrets/`**: Local storage for sensitive keys (e.g., GCP JSON keys).

## 🚀 Professional Workflow (Bootstrap)
The environment is **environment-agnostic** and uses an interactive bootstrap process to handle secrets safely.

1.  **Initialize the Environment**:
    ```bash
    ./sh/bootstrap.sh
    ```
    - This script validates your local setup.
    - If `.env` is missing, it creates one from `.env.template`.
    - It interactively prompts for sensitive data (GCP keys, DB passwords) if not set.
    - It ensures all persistence directories and permissions are correctly configured.

2.  **Secret Management**:
    - Credentials are kept in `.env` (ignored by git).
    - GCP authentication is handled via the standard `GOOGLE_APPLICATION_CREDENTIALS` environment variable, injected across all cluster nodes.

## 🛠️ Technical Specifications
- **Spark Cluster**: 1 Master + 2 Workers (Configured for 2GB RAM / 2 Cores each).
- **AI/LLM Optimization**:
  - **Apache Arrow**: Enabled for high-performance Pandas UDFs.
  - **Kryo Serialization**: Optimized for broadcasting large model tensors.
- **Tracking**: Integrated **MLflow** server (`http://mlflow:5000`) for experiment logging.
- **Data Ingestion**: Native **BigQuery** support via the pre-configured Spark connector.

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

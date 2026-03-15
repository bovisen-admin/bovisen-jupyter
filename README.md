# bovisen-jupyter

Persistent JupyterLab environment for Bovisen data science workloads, deployed on Railway via Docker.

> This repository is managed by Claude Code under the Bovisen 100% AI DevOps model.

---

## Purpose

Provides a reproducible, always-on JupyterLab instance with pre-installed packages for time-series analysis, signal processing, and ClickHouse-connected data pipelines.

---

## Railway Deployment

1. Connect this repo to a Railway project.
2. Railway will auto-detect `railway.json` and build from the `Dockerfile`.
3. Attach a Railway Volume mounted at `/home/jovyan/work` to persist notebooks and data between deployments.
4. Set the required environment variables (see below).
5. Run `setup.ipynb` on first launch to initialise the directory structure.

---

## Environment Variables

| Variable | Required | Description |
|---|---|---|
| `JUPYTER_TOKEN` | Yes | Secret token to authenticate JupyterLab access |
| `JUPYTER_ENABLE_LAB` | Yes (set in Dockerfile) | Must be `yes` to enable JupyterLab UI |
| `RAILWAY_RUN_UID` | Yes | Set to `0` so the container runs as root on Railway |
| `JUPYTER_WORK_DIR` | Optional | Working directory override (default `/home/jovyan/work`) |
| `CLICKHOUSE_HOST` | Added later | ClickHouse server hostname |
| `CLICKHOUSE_USER` | Added later | ClickHouse username |
| `CLICKHOUSE_PASSWORD` | Added later | ClickHouse password |

---

## Volume

Mount a Railway Volume at:

```
/home/jovyan/work
```

This path persists notebooks, data, models, and exports across container restarts and redeployments.

---

## Directory Structure

```
/home/jovyan/work/
├── notebooks/   # Analysis and exploration notebooks
├── data/        # Raw and processed data files
├── models/      # Saved model artefacts
└── exports/     # Reports, charts, and output files
```

Run `setup.ipynb` once on first launch to create these directories.

---

## Adding New Python Packages

1. Add the package to the `pip install` block in `Dockerfile`.
2. Commit and push to `main`.
3. Railway will automatically rebuild and redeploy the image.

---

## Pre-installed Packages (beyond datascience-notebook base)

- `clickhouse-connect` — ClickHouse database connectivity
- `filterpy` — Kalman filters and Bayesian filtering
- `dtaidistance` — Dynamic time warping and time-series distance
- `stumpy` — Matrix profile for time-series analysis
- `pyarrow` — Columnar in-memory data and Parquet support
- `openpyxl` — Excel file read/write
- `plotly` — Interactive visualisations
- `kaleido` — Static image export for Plotly charts

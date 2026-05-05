#!/bin/bash

set -e

# Start Streamlit first (background)
streamlit run ui/app.py --server.port 8501 --server.address 0.0.0.0 &

# Start FastAPI (foreground - keeps container alive)
exec uvicorn src.diabetes_prediction.api.main:app \
  --host 0.0.0.0 \
  --port $PORT
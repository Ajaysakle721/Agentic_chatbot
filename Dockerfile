#syntax=docker/dockerfile:1
FROM python:3.12-slim

WORKDIR /app

ENV DONTWRITEBYTECODE=1
    ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt 

COPY app ./app
COPY ui ./ui
COPY README.md ./README.mp

EXPOSE 8000 8501
CMD ["unicorn", "app.main.app", "-host", "0.0.0.0", "--port","8000"]
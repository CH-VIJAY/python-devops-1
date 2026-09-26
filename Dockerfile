FROM python:3.12-slim
LABEL authors="Vijay"
##Create Non root User
RUN useradd --create-home --shell /bin/bash appuser

WORKDIR /app

##Install dependencies first for Docker layer caching
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

## Copy Application
COPY app.py .

## Change Ownership

RUN chown -R appuser:appuser /app
USER appuser
EXPOSE 8080
ENV APP_VERSION=1.0.0
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "2", "app:app"]

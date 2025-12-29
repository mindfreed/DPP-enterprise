# DPP Enterprise - Production Docker Image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements_final.txt .
RUN pip install --no-cache-dir -r requirements_final.txt

# Copy application files
COPY dpp_final.py .
COPY sora_integration.py .

# Expose port
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD python -c "import requests; requests.get('http://localhost:8000/api/v1/health')" || exit 1

# Run the application
CMD ["python", "dpp_final.py"]

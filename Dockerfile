# 1. Base image
FROM python:3.11-slim

# 2. Set work directory
WORKDIR /app

# 3. Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    which python && \
    which uvicorn && \
    python -m uvicorn --version

# 4. Copy project files
COPY . .

EXPOSE 10000

# 7. Run uvicorn with full path to the app
CMD ["python", "-m", "uvicorn", "Real_estate_ai.py", "--host", "0.0.0.0", "--port", "10000"]

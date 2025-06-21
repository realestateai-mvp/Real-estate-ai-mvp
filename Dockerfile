# Use lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port
EXPOSE 80

# Run uvicorn using full path (safe)
CMD ["python", "-m", "uvicorn", "Real_estate_ai:app", "--host", "0.0.0.0", "--port", "80"]
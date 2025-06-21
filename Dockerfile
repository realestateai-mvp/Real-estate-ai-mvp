FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy everything else
COPY . .

# Expose port 80
EXPOSE 80

# Run the app with uvicorn via python module (more reliable)
CMD ["python", "-m", "uvicorn", "Real_estate_ai:app", "--host", "0.0.0.0", "--port", "80"]
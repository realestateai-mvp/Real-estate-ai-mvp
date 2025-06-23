FROM python:3.11-slim

# Set working directory
WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt
RUN pip show uvicorn
RUN which uvicorn

# Copy everything else
COPY . .

# Expose port 80
EXPOSE 80

# Run the app with uvicorn via python module (more reliable)
CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

# 1. Start from a lightweight base image
FROM python:3.11-slim

# 2. Set working directory
WORKDIR /app

# 3. Copy requirements first to leverage Docker cache
COPY requirements.txt .

# 4. Install requirements
RUN pip install --no-cache-dir -r requirements.txt
RUN which uvicorn
RUN pip show uvicorn
ENV PATH="/root/.local/bin:${PATH}"

# 5. Then copy all files into the container
COPY . .

# 6. Expose port 80 for the application
EXPOSE 80

# 7. Command to run your app with uvicorn
CMD ["uvicorn", "Real_estate_ai:app", "--host", "0.0.0.0", "--port", "80"]

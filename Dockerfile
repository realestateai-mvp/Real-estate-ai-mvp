# 1. Base image
FROM python:3.11-slim

# 2. Set work directory
WORKDIR /app

# 3. Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy project files
COPY . .

# 5. Ensure /root/.local/bin is in PATH (for pip-installed binaries)
ENV PATH="/root/.local/bin:$PATH"

# 6. Expose port
EXPOSE 80

# 7. Run uvicorn with full path to the app
CMD ["uvicorn", "Real_estate_ai:app", "--host", "0.0.0.0", "--port", "80"]

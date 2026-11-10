# Use official Python image as base
FROM python:3.11-slim
RUN apt-get update && apt-get upgrade -y --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip setuptools && \
    pip install -r requirements.txt

# Copy source code
COPY . .

# Expose port and run app
EXPOSE 5000
CMD ["python", "app/app.py"]

# Stage 1: Build dependencies and install Python packages
FROM python:3.12-slim AS builder

WORKDIR /app

# Install system dependencies required for mysqlclient
RUN apt-get update && \
    apt-get install -y gcc default-libmysqlclient-dev build-essential && \
    rm -rf /var/lib/apt/lists/*

# Copy application code
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip && pip install --user -r requirements.txt

# Stage 2: Final image for running the application
FROM python:3.12-slim

WORKDIR /app

# Install runtime system dependencies for mysqlclient
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy installed Python packages from builder
COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

# Copy application code
COPY . .

ENV PYTHONUNBUFFERED=1

# Download wait-for-it script
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

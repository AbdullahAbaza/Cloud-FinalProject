# Stage 1: build stage --> using python:alpine as base image
FROM python:3.12.4-alpine3.20 AS base

# Install build dependancies
RUN apk add --no-cache \
    build-base \
    postgresql-dev \
    python3-dev \
    libpq

# Set work directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Final stage
FROM python:3.12.4-alpine3.20

# Set work directory
WORKDIR /app

# Install runtime dependencies
RUN apk add --no-cache libpq

# Copy only the necessary files from the build stage
COPY --from=base /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=base /usr/local/bin /usr/local/bin

# Copy application code
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["gunicorn", "clinic.wsgi:application", "--bind", "0.0.0.0:8000", "--timeout", "120"]


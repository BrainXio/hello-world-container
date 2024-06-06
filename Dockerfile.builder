# Define build arguments
ARG IMAGE_BASE=alpine
ARG IMAGE_VERSION=3.20.0

# Stage 1: Build
FROM ${IMAGE_BASE}:${IMAGE_VERSION} as build

# Install Python and build dependencies
RUN apk add --no-cache python3-dev py3-pip build-base

# Set the working directory
WORKDIR /app

# Create a virtual environment
RUN python3 -m venv venv

# Activate virtual environment and install dependencies
COPY requirements.txt .
RUN . venv/bin/activate && pip install --no-cache-dir -r requirements.txt

# Copy the application source code
COPY src/ .

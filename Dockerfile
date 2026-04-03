FROM python:3.12-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Clone OpenHands
RUN git clone https://github.com/All-Hands-AI/OpenHands.git .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -e .

# Install frontend dependencies (if needed)
WORKDIR /app/frontend
RUN npm install
RUN npm run build

WORKDIR /app
EXPOSE 3000

CMD ["python", "-m", "openhands.core.main"]

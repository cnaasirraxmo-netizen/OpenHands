FROM python:3.12-slim
WORKDIR /app
RUN apt-get update && apt-get install -y git curl
RUN git clone https://github.com/All-Hands-AI/OpenHands.git .
RUN pip install -r requirements.txt
EXPOSE 3000
CMD ["make", "run"]

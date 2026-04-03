FROM docker.all-hands.dev/all-hands-ai/openhands:0.34

# Ku samee config.toml si toos ah
RUN mkdir -p /root/.openhands && \
    echo '[core]' > /root/.openhands/config.toml && \
    echo 'workspace_base = "/workspace"' >> /root/.openhands/config.toml && \
    echo 'skip_input_validation = true' >> /root/.openhands/config.toml && \
    echo '' >> /root/.openhands/config.toml && \
    echo '[llm]' >> /root/.openhands/config.toml && \
    echo 'model = "openai/gpt-4o"' >> /root/.openhands/config.toml && \
    echo 'api_key = "${OPENROUTER_API_KEY}"' >> /root/.openhands/config.toml && \
    echo 'base_url = "https://openrouter.ai/api/v1"' >> /root/.openhands/config.toml

# Ku qeex port-ka (OpenHands wuxuu isticmaalaa 3000)
EXPOSE 3000

# Bedel CMD si uu u bilaabo qaab server (HTTP API)
CMD ["openhands", "run", "--server", "--port", "3000"]

FROM ghcr.io/all-hands-ai/openhands:0.34

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

EXPOSE 3000

CMD ["openhands", "run", "--server", "--host", "0.0.0.0", "--port", "3000"]

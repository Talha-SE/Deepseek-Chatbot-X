# Use the official Ollama base image
FROM ollama/ollama

# Pre-pull the DeepSeek Chat model (saves time at container boot)
RUN ollama pull deepseek-chat

# Expose Ollama default API port
EXPOSE 11434

# Start Ollama server
CMD ["ollama", "serve"]

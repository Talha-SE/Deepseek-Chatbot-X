# Use the official Ollama base image
FROM ollama/ollama

# Expose Ollama default API port
EXPOSE 11434

# Create startup script
COPY <<EOF /start.sh
#!/bin/sh
echo "Starting Ollama service..."
nohup ollama serve &
echo "Waiting for Ollama service to initialize..."
sleep 10

# Try to pull the model with correct model ID
echo "Pulling DeepSeek model..."
ollama pull deepseek-coder || ollama pull deepseek-ai/deepseek-coder:latest || echo "Warning: Model pull failed, will use on first request"

# Keep ollama running in foreground
echo "Ollama service is ready"
wait
EOF

# Make the script executable
RUN chmod +x /start.sh

# Start using the script
ENTRYPOINT ["/bin/sh"]
CMD ["/start.sh"]
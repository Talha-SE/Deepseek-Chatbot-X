# Use the official Ollama base image
FROM ollama/ollama

# Expose Ollama default API port
EXPOSE 11434

# Create startup script
COPY <<EOF /start.sh
#!/bin/sh
# Start Ollama in the background
nohup ollama serve &
# Wait for Ollama to start (give it a few seconds)
sleep 5
# Pull the model (if not already downloaded)
ollama pull deepseek-chat
# Bring ollama back to foreground
wait
EOF

# Make the script executable
RUN chmod +x /start.sh

# Start using the script
CMD ["/start.sh"]

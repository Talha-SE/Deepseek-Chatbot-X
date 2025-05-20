FROM ollama/ollama

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose default Ollama API port
EXPOSE 11434

# Start Ollama using script
CMD ["/bin/sh", "/start.sh"]

# Use the official Ollama base image
FROM ollama/ollama

# Expose Ollama default API port
EXPOSE 11434

# Copy the startup script
COPY start.sh /start.sh

# Make the script executable
RUN chmod +x /start.sh

# Start using the script
ENTRYPOINT ["/bin/sh"]
CMD ["/start.sh"]
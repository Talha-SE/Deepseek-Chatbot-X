FROM ollama/ollama

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose default Ollama API port
EXPOSE 11434

# Override the default ENTRYPOINT and set the startup script
ENTRYPOINT ["/bin/sh"]
CMD ["/start.sh"]

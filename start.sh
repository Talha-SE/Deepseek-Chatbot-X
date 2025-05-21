#!/bin/sh

echo "🔧 Starting Ollama service..."
ollama serve &

# Wait for Ollama to initialize
echo "⏳ Waiting for Ollama to boot..."
sleep 15  # Increased wait time for stability

# Pull a tiny LLM model instead
echo "Pulling tinyllama:latest..."
ollama pull tinyllama

echo "✅ Ollama with TinyLLama is ready to roll!"

# Keep the container alive
tail -f /dev/null

#!/bin/sh

echo "🔧 Starting Ollama service..."
ollama serve &

# Wait for Ollama to initialize
echo "⏳ Waiting for Ollama to boot..."
sleep 10

# Pull the Mistral model instead of DeepSeek
echo "Pulling mistral:7b-instruct..."
ollama pull mistral:7b-instruct

echo "✅ Ollama with Mistral is ready to roll!"

# Keep the container alive
tail -f /dev/null

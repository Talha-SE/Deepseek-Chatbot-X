#!/bin/sh

echo "🔧 Starting Ollama service..."
ollama serve &

# Wait for Ollama to initialize
echo "⏳ Waiting for Ollama to boot..."
sleep 10

# Pull the DeepSeek Chat model
echo "⬇️ Pulling DeepSeek Chat model..."
ollama pull deepseek-chat

echo "✅ Ollama with DeepSeek Chat is ready to roll!"

# Keep the container alive
tail -f /dev/null

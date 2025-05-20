#!/bin/sh

echo "🔧 Starting Ollama service..."
ollama serve &

# Wait for Ollama to initialize
echo "⏳ Waiting for Ollama to boot..."
sleep 10

# Pull both DeepSeek models
echo "⬇️ Pulling DeepSeek Coder model..."
ollama pull deepseek-coder || echo "Warning: deepseek-coder pull failed"

echo "⬇️ Pulling DeepSeek Chat model..."
ollama pull deepseek-chat || echo "Warning: deepseek-chat pull failed"

# Test that the API is working properly
echo "🧪 Testing API health..."
curl -s http://localhost:11434/api/tags

# Register a chat-specific model alias if needed
echo "⚙️ Setting up model aliases..."
curl -s -X POST http://localhost:11434/api/create -d '{
  "name": "deepseek-chat-alias",
  "model": "deepseek-chat"
}'

echo "✅ Ollama with DeepSeek models is ready to roll!"
echo "📝 API Usage: Send POST requests to /api/chat with model 'deepseek-chat' or 'deepseek-chat-alias'"

# Keep the container alive
tail -f /dev/null

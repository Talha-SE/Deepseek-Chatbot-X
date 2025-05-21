#!/bin/sh

echo "🔧 Starting Ollama service..."
ollama serve &

# Wait for Ollama to initialize
echo "⏳ Waiting for Ollama to boot..."
sleep 10

# Check if Ollama is running
if ! curl -s http://localhost:11434/api/version > /dev/null; then
  echo "❌ Error: Ollama service is not responding. Please check the logs."
  exit 1
fi
echo "✅ Ollama service is running"

# Pull the TinyLlama model instead of Mistral
echo "Pulling tinyllama..."
if ! ollama pull tinyllama; then
  echo "❌ Error: Failed to pull the TinyLlama model. Please check your network or Ollama configuration."
  exit 1
fi

# Verify model was pulled successfully
if ollama list | grep -q "tinyllama"; then
  echo "✅ TinyLlama model successfully pulled"
else
  echo "❌ Warning: TinyLlama model may not have been pulled correctly"
  exit 1
fi

echo "✅ Ollama with TinyLlama is ready to roll!"

# Keep the container alive
tail -f /dev/null

# Create a file named test_request.json
echo {\"model\":\"tinyllama\",\"messages\":[{\"role\":\"user\",\"content\":\"Tell me a short joke\"}]} > test_request.json

# Send the request using the file
if ! curl.exe -X POST https://deepseek-chatbot-x.onrender.com/api/chat -H "Content-Type: application/json" -d @test_request.json; then
  echo "❌ Error: Failed to send test request. Please check the API endpoint or network."
  exit 1
fi
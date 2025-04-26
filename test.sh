#!/bin/bash

curl -X POST http://localhost:5000/prompt \
-H 'Content-Type: application/json' \
-d '{"prompt": "What is the meaning of life?"}'

# curl http://localhost:11434/api/generate -d '{
#   "model": "llama3.2",
#   "prompt": "Why is the sky blue?",
#   "stream": false
# }'
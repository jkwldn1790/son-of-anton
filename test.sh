#!/bin/bash

curl -X POST http://localhost:3000/prompt \
-H 'Content-Type: application/json' \
-d '{"prompt": "What is the capital of France?"}'
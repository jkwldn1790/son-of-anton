from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

url = "http://localhost:11434/api/generate"

# test
# curl -X POST http://localhost:3000/prompt \                                                          ] 11:12 PM
# -H "Content-Type: application/json" \
# -d '{"prompt": "What is the capital of France?"}'

@app.route("/health", methods=["GET"])
def health():
    return "Healthy!"

# Endpoint to accept prompts and send them to Ollama
@app.route("/prompt", methods=["POST"])
def process_prompt():
    data = request.get_json()
    prompt = data.get("prompt")
    
    data = {
        "model": "llama3.2",
        "prompt": prompt,
        "stream": False
    }

    headers = {
        "Content-Type": "application/json"
    }
    response = requests.post(url, headers=headers, json=data)
    response.raise_for_status()
    result = response.json()
    return result['response']

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=3000)

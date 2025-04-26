import requests

def send_post_request(url, data):
    try:
        response = requests.post(url, json=data)
        response.raise_for_status()
        return response.json()
    except requests.RequestException as e:
        print(f"Request failed: {e}")
        return None

url = "http://localhost:11434/api/generate"

data = {
    "model": "llama3.2",
    "prompt": "How many licks to the center of a tootsie pop?",
    "stream": False
}

response_data = send_post_request(url, data)

if response_data:
    print(response_data['response'])
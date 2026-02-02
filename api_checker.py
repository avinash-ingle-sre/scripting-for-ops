import requests
import time

URLS = ["https://www.google.com", "https://api.github.com", "http://localhost:8080"]

def check_health():
    print(f"--- API Health Check Status ---")
    for url in URLS:
        try:
            response = requests.get(url, timeout=5)
            if response.status_code == 200:
                print(f"✅ {url} is UP! (Status: {response.status_code})")
            else:
                print(f"⚠️ {url} is shaky (Status: {response.status_code})")
        except requests.exceptions.RequestException as e:
            print(f"❌ {url} is DOWN! (Error: Connection Failed)")

if __name__ == "__main__":
    check_health()

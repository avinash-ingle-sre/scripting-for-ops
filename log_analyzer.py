import os

LOG_FILE = "access.log"

def analyze_logs():
    if not os.path.exists(LOG_FILE):
        print(f"❌ Error: {LOG_FILE} not found!")
        return

    error_404 = 0
    error_500 = 0
    
    with open(LOG_FILE, 'r') as file:
        for line in file:
            if "404" in line:
                error_404 += 1
            elif "500" in line:
                error_500 += 1
                
    print(f"--- Log Analysis Report ---")
    print(f"Total 404 Errors: {error_404}")
    print(f"Total 500 Errors: {error_500}")
    
    if error_500 > 5:
        print("⚠️  CRITICAL: High number of 500 errors detected! Check server health.")

if __name__ == "__main__":
    analyze_logs()

import os

# ज्या व्हेरिएबल्सची गरज आहे त्यांची लिस्ट
REQUIRED_VARS = ["USER", "HOME", "DB_URL"] 

def check_env_vars():
    missing_vars = []
    for var in REQUIRED_VARS:
        if os.getenv(var):
            print(f"✅ Found: {var}")
        else:
            missing_vars.append(var)
    
    if missing_vars:
        print(f"❌ Missing Variables: {', '.join(missing_vars)}")
        # इथे तू स्क्रिप्ट 'exit(1)' करू शकतोस जेणेकरून पुढची स्टेप थांबेल
    else:
        print("🚀 All environment variables are set!")

if __name__ == "__main__":
    check_env_vars()

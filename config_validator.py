import yaml
import os

# १. अनिवार्य असणारे कीज (Mandatory Keys)
REQUIRED_KEYS = ["version", "app_name", "environment", "replicas"]
CONFIG_FILE = "config.yaml"

def validate_config():
    if not os.path.exists(CONFIG_FILE):
        print(f"❌ Error: {CONFIG_FILE} not found!")
        return

    try:
        with open(CONFIG_FILE, 'r') as file:
            data = yaml.safe_load(file)
            
            # २. लॉजिक: सर्व कीज आहेत का तपासणे
            missing_keys = [key for key in REQUIRED_KEYS if key not in data]
            
            if missing_keys:
                print(f"❌ Validation Failed! Missing keys: {', '.join(missing_keys)}")
            else:
                # ३. डेटा टाईप चेक करणे
                if not isinstance(data['replicas'], int):
                    print("❌ Validation Failed! 'replicas' must be an integer.")
                else:
                    print(f"✅ Configuration for '{data['app_name']}' is valid!")

    except yaml.YAMLError as exc:
        print(f"❌ Error in YAML syntax: {exc}")

if __name__ == "__main__":
    validate_config()

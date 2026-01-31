import json

print("--- Safe JSON Parser ---")

# लक्ष द्या: या JSON मध्ये 'PublicIp' नाहीये! (Simulating a Stopped Instance)
aws_response = '{"InstanceId": "i-99999", "Status": "stopped"}'

try:
    # 1. Parsing
    server_info = json.loads(aws_response)
    
    # 2. डेटा काढण्याचा प्रयत्न (Risk Area)
    print("Instance ID:", server_info["InstanceId"])
    
    # इथे एरर येणार, कारण PublicIp नाहीये
    print("Trying to find IP...")
    print("Public IP:", server_info["PublicIp"]) 

except KeyError as e:
    # 3. एरर आली तर इथे या (Safety Net)
    print(" ALERT: Key not found in JSON data!")
    print(f" Missing detail: {e}")

except json.JSONDecodeError:
    # जर JSON फॉरमॅटच चुकीचा असेल तर
    print(" ALERT: Invalid JSON format received!")

print("--- Script Finished Successfully (No Crash) ---")

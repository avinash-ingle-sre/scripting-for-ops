import json

print("--- AWS Config Parser ---")

# समजा हे AWS कडून आलेले आउटपुट आहे (हा डेटा String आहे)
aws_response = '{"InstanceId": "i-0abcd1234efgh5678", "InstanceType": "t2.micro", "PublicIp": "54.21.10.120"}'

# 1. Parsing: स्ट्रिंगला Python Dictionary मध्ये बदला
# json.loads() याचा अर्थ 'Load String'
server_info = json.loads(aws_response)

# 2. डेटा बाहेर काढणे (Using Keys)
# आता आपण याला नावाने हाक मारू शकतो
my_id = server_info["InstanceId"]
my_ip = server_info["PublicIp"]

print("Server ID Found:", my_id)
print("Public IP is:", my_ip)

print("--- Parsing Done ---")

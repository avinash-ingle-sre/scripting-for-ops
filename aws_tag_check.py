import boto3

def check_ec2_tags():
    # १. EC2 क्लायंट तयार करणे
    ec2 = boto3.client('ec2', region_name='us-east-1') # तुझा रिजन इथे टाक
    
    print("--- Fetching EC2 Instances ---")
    response = ec2.describe_instances()
    
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            tags = instance.get('Tags', [])
            
            # २. 'Environment' टॅग शोधणे
            has_env_tag = any(t['Key'] == 'Environment' for t in tags)
            
            if not has_env_tag:
                print(f"⚠️  ALERT: Instance {instance_id} is missing 'Environment' tag!")
            else:
                env_value = [t['Value'] for t in tags if t['Key'] == 'Environment'][0]
                print(f"✅ Instance {instance_id} is tagged as: {env_value}")

if __name__ == "__main__":
    check_ec2_tags()

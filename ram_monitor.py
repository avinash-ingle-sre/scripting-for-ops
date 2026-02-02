import psutil
import datetime

# १. कॉन्फिगरेशन
THRESHOLD = 80 # ८०% च्या वर रॅम गेली की अलर्ट

def check_ram():
    # रॅमची माहिती मिळवणे
    memory = psutil.virtual_memory()
    usage = memory.percent
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    print(f"[{timestamp}] RAM Usage: {usage}%")

    # २. अलर्ट लॉजिक
    if usage > THRESHOLD:
        print(f"[{timestamp}] ⚠️ ALERT: High RAM usage detected!")
    else:
        print(f"[{timestamp}] ✅ RAM usage is within normal limits.")

if __name__ == "__main__":
    check_ram()

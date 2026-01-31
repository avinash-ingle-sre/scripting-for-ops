print("--- Error Time Report ---")

# 1. फाइल उघडा
with open("test.log", "r") as file:
    for line in file:
        
        # 2. फिल्टर (फक्त ERROR ओळी घ्या)
        if "ERROR" in line:
            
            # 3. तुकडे करा (Split)
            parts = line.split(" ")
            
            # 4. डेटा काढा (Time is at index 1)
            error_time = parts[1]
            
            print("Issue found at:", error_time)

print("--- Report Generated ---")

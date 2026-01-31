import os

folder_name = "backup_logs"

print("--- Checking Directory ---")

if os.path.exists(folder_name):
    print("Folder already exists:", folder_name)
else:
    print("Folder not found. Creating it now...")
    os.mkdir(folder_name)
    print("Success: Folder created!")

print("--- Done ---")

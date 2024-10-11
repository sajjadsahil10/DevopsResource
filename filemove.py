import shutil
import os
import time
from datetime import datetime, timedelta

def move_old_files(source_dir, target_dir, days_old):
    """
    Move files older than a specified number of days to a different disk drive.

    :param source_dir: Directory to search for old files.
    :param target_dir: Directory to move the old files to.
    :param days_old: Number of days to check for file modification.
    """
    # Calculate the cutoff time
    cutoff_time = time.time() - (days_old * 86400)  # 86400 seconds in a day
    
    # Ensure the target directory exists
    os.makedirs(target_dir, exist_ok=True)

    # Loop through files in the source directory
    for filename in os.listdir(source_dir):
        source_file_path = os.path.join(source_dir, filename)

        # Check if it's a file (not a directory)
        if os.path.isfile(source_file_path):
            # Get the last modification time
            mod_time = os.path.getmtime(source_file_path)

            # Check if the file is older than the cutoff time
            if mod_time < cutoff_time:
                try:
                    # Define the target file path
                    target_file_path = os.path.join(target_dir, filename)

                    # Copy the file to the target location
                    shutil.copy2(source_file_path, target_file_path)
                    print(f"Copied '{source_file_path}' to '{target_file_path}'")

                    # Remove the original file
                    os.remove(source_file_path)
                    print(f"Deleted original file: '{source_file_path}'")
                    
                except Exception as e:
                    print(f"Error moving file '{source_file_path}': {e}")

if __name__ == "__main__":
    # Set your source and target directories
    source_directory = r"D:\source_folder"  # Change to your source directory
    target_directory = r"E:\target_folder"   # Change to your target directory
    days_threshold = 50  # Number of days

    move_old_files(source_directory, target_directory, days_threshold)

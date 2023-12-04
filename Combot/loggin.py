import json
from datetime import datetime
import os


def log_chat_info(user, command, osname,architecture, release, log_file= f'{os.getcwd()}/combot/computer.json'):
    log_dir = os.path.dirname(log_file)

    if not os.path.exists(log_dir):
        os.makedirs(log_dir)

    if os.path.exists(log_file):
        with open(log_file, 'r') as file:
            chat_data = json.load(file)
        if chat_data:
            cutoff_date = datetime.now().timestamp() - (7 * 24 * 60 * 60)  # Example: keep data from the last 7 days
            chat_data = [entry for entry in chat_data if datetime.fromisoformat(entry['timestamp']).timestamp() > cutoff_date]

        
        
        
        # Append the new data
        timestamp = str(datetime.now())

        chat_data.append({'timestamp': timestamp, 'user': user, 'command': command, 'name': osname, "architecture":architecture, "release": release })

        with open(log_file, 'w') as file:
            json.dump(chat_data, file, indent=2)

    else:
        # If the file doesn't exist, create a new file and log the data
        timestamp = str(datetime.now())
        chat_data = [{'timestamp': timestamp, 'user': user, 'command': command}]

        with open(log_file, 'w') as file:
            json.dump(chat_data, file, indent=2)


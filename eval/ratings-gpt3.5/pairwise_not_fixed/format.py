import glob
import json
import os

file_list = glob.glob('*.jsonl')

all_data = []
for file_name in file_list:
    with open(file_name, 'r') as f:
        all_data.append([json.loads(line) for line in f.readlines()]) 

for file_name, data in zip(file_list, all_data):
    with open(os.path.join('../formatted/', file_name), 'w') as f:
        for line in data:
            f.write(json.dumps(line, indent=2) + '\n')


import json
import time

import openai

def prompt_formatting(history):
    messages = [{'role': 'system', 'content': history[0]}]
    for idx, content in enumerate(history[1:]):
        if 0 == idx % 2:
            messages.append({'role': 'user', 'content': content})
        else:
            messages.append({'role': 'assistant', 'content': content})

    return messages

def call(history):
    with open('../keys/openai_org_id', 'r') as f:
        openai.organization = f.readline().strip()
    
    with open('../keys/openai_key', 'r') as f:
        openai.api_key = f.readline().strip()
    
    messages = prompt_formatting(history)
    while True:
        try:
            response = openai.ChatCompletion.create(
                            model='gpt-4-0613',
                            messages=messages,
                            temperature=0.2,
                            max_tokens=500,
                            frequency_penalty=0,
                            presence_penalty=0,
                            n=1,
                            )
            break
        except:
            time.sleep(2)
            print('Errrrrrrrrrrrrrrrrrr')
    
    prediction = response['choices'][0]['message']['content']

    return prediction

if __name__ == '__main__':
    with open('src/sys_prompt', 'r') as f:
        sys_prompt = f.read().strip()

    with open('src/prompt', 'r') as f:
        prompt = f.read().strip()

    history = [sys_prompt, prompt]
    print(call(history))


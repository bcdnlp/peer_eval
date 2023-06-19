import time

import anthropic

def prompt_formatting(history):
    prompt = f"{anthropic.HUMAN_PROMPT} {history[0]}"
    for idx, content in enumerate(history[1:]):
        if 0 == idx % 2:
            message = f"{anthropic.HUMAN_PROMPT}\n{content}"
        else:
            message = f"{anthropic.AI_PROMPT}\n{content}"
        prompt = ''.join([prompt, message])

    prompt = ''.join([prompt, f"{anthropic.AI_PROMPT}"])

    return prompt

def call(history):
    with open('../keys/anthropic_key', 'r') as f:
        api_key = f.read().strip()
    
    client = anthropic.Client(api_key)

    prompt = prompt_formatting(history)
    while True:
        try:
            response = client.completion(
                           prompt=prompt,
                           stop_sequences=[anthropic.HUMAN_PROMPT],
                           max_tokens_to_sample=500,
                           model='claude-1',
                           temperature=0.2,
                           )
            break
        except:
            time.sleep(2)
            print('Errrrrrrrrrrrrrrrrrr')

    prediction = response['completion']

    return prediction
    
if __name__ == '__main__':
    with open('src/sys_prompt', 'r') as f:
        sys_prompt = f.read().strip()

    with open('src/prompt', 'r') as f:
        prompt = f.read().strip()

    print(call(sys_prompt, prompt))


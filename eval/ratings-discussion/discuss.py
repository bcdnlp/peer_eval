import json
import re
import time

import pandas as pd
from html2text import html2text
from tqdm import tqdm

import anthropic_api
import openai_api
from prompt_generation import prompt_discuss_generation

def api_call(model_name, content):
    if 'gpt4' == model_name:
        return openai_api.call(content)
    elif 'claude' == model_name:
        return anthropic_api.call(content)

def result_extraction(text):
    try:
        preference = int(text.strip().split('\n')[-1].strip())
        return preference
    except:
        return -1

def history_formatting(history, reviewers):
    if 'gpt4' == reviewers[0]:
        prompt = [{'system': history[0]},
                  {'background': history[1]}]
        history = history[2:]
    elif 'claude' == reviewers[0]:
        prompt = [{'system': history[0]}]
        history = history[1:]

    for idx, content in enumerate(history):
        if 0 == idx % 2:
            prompt.append({f'{reviewers[0]}': {
                                'content': content,
                                'preference': result_extraction(content)
                           }})
        else:
            prompt.append({f'{reviewers[1]}': {
                                'content': content,
                                'preference': result_extraction(content)
                           }})
    return prompt

def run(reviewers):
    path = 'model_diff_preference.json'
    with open(path, 'r') as f:
        diff_list = json.load(f)
    print(len(diff_list))

    reviewers_name = '_'.join(reviewers + ['discussion'])

    f = open(f'{reviewers_name}-log.txt', 'w')

    chats_history = []
    for d in tqdm(diff_list):
        # extract information
        question = d['question']
        answer_a = d['answer_a']
        answer_b = d['answer_b']
        answer_a_type = d['answer_a_type']
        answer_b_type = d['answer_b_type']

        # results from the first round
        justification_reviewer1 = d[f'justification_{reviewers[0]}']
        justification_reviewer2 = d[f'justification_{reviewers[1]}']

        # generate prompts for the 1st round
        reviewer1_history, reviewer2_history = prompt_discuss_generation(
                                                  reviewers,
                                                  question,
                                                  answer_a,
                                                  answer_b,
                                                  justification_reviewer1,
                                                  justification_reviewer2,
                                                  )
        # just for debug
        for text in reviewer1_history:
            print('system:' + text + '\n')
            print('system:' + text + '\n', file=f)

        for i in range(3):
            if 0 == i % 2: # reviewer1, round 1, 3
                justification = api_call(reviewers[0], reviewer1_history)
            else: # reviewer2, round 2
                justification = api_call(reviewers[1], reviewer2_history)
            reviewer1_history.append(justification)
            reviewer2_history.append(justification)

            # just for debug
            print(reviewers[i%2] + ':\n')
            print(justification + '\n')
            print(reviewers[i%2] + ':\n', file=f)
            print(justification + '\n', file=f)

        print('--------', file=f)
        
        instance = {'question': question,
                    'answer_a': answer_a,
                    'answer_b': answer_b,
                    'answer_a_type': answer_a_type,
                    'answer_b_type': answer_b_type,
                    'initial_justification_claude': {
                        'justification': d['justification_claude'],
                        'preference': d['preference_claude']
                    },
                    'initial_justification_gpt4': {
                        'justification': d['justification_gpt4'],
                        'preference': d['preference_gpt4']
                    },
                    f'{reviewers_name}':
                        history_formatting(reviewer1_history, reviewers)
                    }

        chats_history.append(instance)

    f.close()

    # save to files
    path = f'{reviewers_name}.json'
    with open(path, 'w') as f:
        json.dump(chats_history, f, indent=2)

if __name__ == '__main__':
    reviewers = ['gpt4', 'claude']
#    reviewers = ['claude', 'gpt4']
    run(reviewers)


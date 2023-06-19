import json
import time

from html2text import html2text

path = 'answer_gpt35-vs-answer_vicuna-13b-claude-1-reviewer_threeclass.jsonl'
with open(path, 'r') as f:
    claude = [json.loads(line) for line in f.readlines()]

path = 'answer_gpt35-vs-answer_vicuna-13b-gpt-4-reviewer-threeclass.jsonl'
with open(path, 'r') as f:
    gpt4 = [json.loads(line) for line in f.readlines()]

path = '../prompts/vicuna_questions.jsonl'
with open(path, 'r') as f:
    questions = [json.loads(line) for line in f.readlines()]
    questions = {q['question_id']: q['text'] for q in questions}

path = 'answer_vicuna-13b.jsonl'
with open(path, 'r') as f:
    answer_vicuna_13b = [json.loads(line) for line in f.readlines()]
    answer_vicuna_13b = {a['answer_id']: a['text'] for a in answer_vicuna_13b}

path = 'answer_gpt35.jsonl'
with open(path, 'r') as f:
    answer_gpt35 = [json.loads(line) for line in f.readlines()]
    answer_gpt35 = {a['answer_id']: a['text'] for a in answer_gpt35}

diff_list = []
for idx, (c, g) in enumerate(zip(claude, gpt4)):
    if c['score'] != g['score']:
        question = questions[c['question_id']]
        answer_a = answer_gpt35[c['answer1_id']]
        answer_b = answer_vicuna_13b[c['answer2_id']]
        answer_a_type = 'gpt35'
        answer_b_type = 'vicuna-13b'
        preference_claude = c['score']
        preference_gpt4 = g['score']
        justification_claude = c['text']
        justification_gpt4 = g['text']

        diff_list.append({'question': question,
                          'answer_a': answer_a,
                          'answer_b': answer_b,
                          'answer_a_type': answer_a_type,
                          'answer_b_type': answer_b_type,
                          'justification_claude': justification_claude,
                          'justification_gpt4': justification_gpt4,
                          'preference_claude': preference_claude,
                          'preference_gpt4': preference_gpt4,
                          })

print(len(diff_list))

with open('model_diff_preference.json', 'w') as f:
    json.dump(diff_list, f, indent=2)


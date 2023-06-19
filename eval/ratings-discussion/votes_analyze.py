import json

#path = 'answer_gpt35-vs-answer_vicuna-13b-gpt-4-reviewer-threeclass.jsonl'
path = 'answer_vicuna-13b-vs-answer_gpt35-gpt-4-reviewer-threeclass.jsonl'
with open(path, 'r') as f:
    gpt4 = [json.loads(line) for line in f.readlines()]

#path = 'answer_gpt35-vs-answer_vicuna-13b-claude-1-reviewer_threeclass.jsonl'
path = 'answer_vicuna-13b-vs-answer_gpt35-claude-1-reviewer_threeclass.jsonl'
with open(path, 'r') as f:
    claude = [json.loads(line) for line in f.readlines()]

def votes_count(data, model):
    count = {'vicuna-13b': 0, 'gpt35': 0, 'tie': 0}
    for d in data:
        p = d['score']
        if -1 == p:
            p = int(input(d['text']))
        if 1 == p:
            count['vicuna-13b'] += 1
#            count['gpt35'] += 1
        elif 2 == p:
            count['gpt35'] += 1
#            count['vicuna-13b'] += 1
        elif 3 == p:
            count['tie'] += 1

    return count

counts = votes_count(gpt4, 'gpt4')
print('GPT4 votes:', counts)
counts = votes_count(claude, 'claude')
print('Claude votes:', counts)
exit()
input('press Enter to continue')

path = '../prompts/vicuna_questions.jsonl'
with open(path, 'r') as f:
    questions = [json.loads(line) for line in f.readlines()]
    questions = {q['question_id']: q['text'] for q in questions}

with open('gpt4_claude_discussion.json', 'r') as f:
    gc_discuss = json.load(f)

with open('claude_gpt4_discussion.json', 'r') as f:
    cg_discuss = json.load(f)

def discuss_vote_count(data, model):
    r1, r2 = model.split('_')
    count = {r1: {'vicuna-13b': 0, 'gpt35': 0, 'tie': 0},
             r2: {'vicuna-13b': 0, 'gpt35': 0, 'tie': 0}}

    for g, c in zip(gpt4, claude):
        assert g['question_id'] == c['question_id']

        flag = False
        for d in data:
            if questions[g['question_id']] != d['question']:
                continue
            flag = True

            history = d[f'{model}_discussion']
   
            # check r1
            p = history[-1][r1]['preference']
            if -1 == p:
                print(json.dumps(history, indent=2))
                p = int(input(r1 + ': '))
            if 1 == p:
                count[r1]['gpt35'] += 1
            elif 2 == p:
                count[r1]['vicuna-13b'] += 1
            elif 3 == p:
                count[r1]['tie'] += 1
    
            # check r2
            p = history[-2][r2]['preference']
            if -1 == p:
                print(json.dumps(history, indent=2))
                p = int(input(r2 + ': '))
            if 1 == p:
                count[r2]['gpt35'] += 1
            elif 2 == p:
                count[r2]['vicuna-13b'] += 1
            elif 3 == p:
                count[r2]['tie'] += 1

            break
        if flag:
            continue

        p = g['score']
        if -1 == p:
            p = int(input(g['text']))
        if 1 == p:
            count['gpt4']['gpt35'] += 1
        elif 2 == p:
            count['gpt4']['vicuna-13b'] += 1
        elif 3 == p:
            count['gpt4']['tie'] += 1
        else:
            raise Error

        p = c['score']
        if -1 == p:
            p = int(input(c['text']))
        if 1 == p:
            count['claude']['gpt35'] += 1
        elif 2 == p:
            count['claude']['vicuna-13b'] += 1
        elif 3 == p:
            count['claude']['tie'] += 1
        else:
            raise Error

    return count

count = discuss_vote_count(gc_discuss, 'gpt4_claude')
print(count)
input('press Enter to continue')
count = discuss_vote_count(cg_discuss, 'claude_gpt4')
print(count)


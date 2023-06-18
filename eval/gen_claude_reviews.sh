#!/bin/bash

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m 'claude-1' \
    -a $1 $2

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m 'claude-1' \
    -a $2 $1

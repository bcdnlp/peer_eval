#!/bin/bash

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5/vicuna/pairwise \
    -m 'gpt-3.5-turbo-0301' \
    -a $1 $2

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5/vicuna/pairwise \
    -m 'gpt-3.5-turbo-0301' \
    -a $2 $1
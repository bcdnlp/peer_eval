#!/bin/bash
# how to run this script 

# ./gen_gpt4_reviews.sh generations/vicuna/answer_claude.jsonl generations/vicuna/answer_gpt4.jsonl
# claude vs {gpt4, gpt35, bard, vicuna-13b} 

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt4 \
    -m 'gpt-4' \
    -a $1 $2

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt4 \
    -m 'gpt-4' \
    -a $2 $1
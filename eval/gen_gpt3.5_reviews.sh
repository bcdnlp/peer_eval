#!/bin/bash
# how to run this script 

# ./gen_gpt3.5_reviews.sh generations/vicuna/answer_[Model 1].jsonl generations/vicuna/answer_[Model 2].jsonl
# gpt4 vs {gpt35, claude, bard, vicuna}

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-3.5-turbo-0301' \
    -a $1 $2

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-3.5-turbo-0301' \
    -a $2 $1
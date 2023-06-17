#!/bin/bash

GEN_PATH=./eval/generations/vicuna

python ./generate_mturk_input.py \
    -q ./eval/prompts/vicuna_questions.jsonl \
    -a \
    $GEN_PATH/answer_bard.jsonl \
    $GEN_PATH/answer_claude.jsonl \
    $GEN_PATH/answer_gpt4.jsonl \
    $GEN_PATH/answer_gpt35.jsonl \
    $GEN_PATH/answer_vicuna-13b.jsonl \
    -o ./mturk_inputs/mturk_input.csv \
    -m 'helpfulness' 'relevance' 'accuracy' 'level of detail'\

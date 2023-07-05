#!/bin/bash
# how to run this script 

# ./gen_gpt3.5_reviews.sh generations/vicuna/answer_[Model 1].jsonl generations/vicuna/answer_[Model 2].jsonl

echo "======================================== bard vs claude ========================================"
python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_bard.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_claude.jsonl

echo "======================================== bard vs gpt4 ========================================"
python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_gpt4.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_bard.jsonl

echo "======================================== bard vs gpt35 ========================================"
python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_gpt35.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_bard.jsonl

echo "======================================== bard vs vicuna-13b ========================================"

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_vicuna-13b.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_bard.jsonl

echo "======================================== claude vs gpt4 ========================================"
python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_gpt4.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_claude.jsonl

echo "======================================== claude vs gpt35 ========================================"
python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_gpt35.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_claude.jsonl

echo "======================================== claude vs vicuna-13b ========================================"
python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_vicuna-13b.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_claude.jsonl

echo "======================================== gpt4 vs gpt35 ========================================"
python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_gpt35.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_gpt4.jsonl

echo "======================================== gpt4 vs vicuna-13b ========================================"
python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_vicuna-13b.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_gpt4.jsonl

echo "======================================== gpt35 vs vicuna-13b ========================================"
python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt4 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_vicuna-13b.jsonl

python eval_gpt_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_gpt35.jsonl

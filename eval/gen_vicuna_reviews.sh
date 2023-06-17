#!/bin/bash


# three score_to_threeclass class based review
# ======================================== bard vs claude ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_claude.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_bard.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

# ======================================== bard vs gpt4 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_gpt4.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_bard.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

# ======================================== bard vs gpt35 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_gpt35.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_bard.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

# ======================================== bard vs vicuna-13b ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_vicuna-13b.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_bard.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

# ======================================== claude vs gpt4 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_gpt4.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_claude.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

# ======================================== claude vs gpt35 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_gpt35.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_claude.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

# ======================================== claude vs vicuna-13b ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_vicuna-13b.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_claude.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

# ======================================== gpt4 vs gpt35 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_gpt35.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_gpt4.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

# ======================================== gpt4 vs vicuna-13b ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_vicuna-13b.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_gpt4.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

# ======================================== gpt35 vs vicuna-13b ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_vicuna-13b.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q prompts/vicuna_questions.jsonl \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_gpt35.jsonl \
    -p prompts/vicuna_prompt_score_to_three.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-vicuna-13b \
    --num-gpus 2
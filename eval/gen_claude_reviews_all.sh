#!/bin/bash

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_gpt4.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_bard.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_bard.jsonl generations/vicuna/answer_vicuna-13b.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_bard.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_gpt35.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_claude.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_gpt4.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_claude.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_claude.jsonl generations/vicuna/answer_vicuna-13b.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_claude.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_gpt4.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_gpt35.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_gpt35.jsonl generations/vicuna/answer_vicuna-13b.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_gpt35.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_gpt4.jsonl generations/vicuna/answer_vicuna-13b.jsonl

python eval_claude_review.py \
    -q prompts/vicuna_questions.jsonl \
    -p prompts/vicuna_prompt_threeclass.jsonl \
    -r prompts/reviewer.jsonl \
    -o ratings-claude \
    -m "claude-1" \
    -a generations/vicuna/answer_vicuna-13b.jsonl generations/vicuna/answer_gpt4.jsonl


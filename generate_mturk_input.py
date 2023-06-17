import argparse
import json
import os
import csv

import numpy as np
import os

def get_json_list(file_path):
    file_path = os.path.expanduser(file_path)
    with open(file_path, "r") as f:
        return [json.loads(line) for line in f]

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="ChatGPT-based QA evaluation.")
    parser.add_argument("-q", "--question-file")
    parser.add_argument("-a", "--answer-file-list", nargs="+", default=[])
    parser.add_argument("-m", "--metrics", nargs="*", default=[])
    parser.add_argument("-o", "--output-review-file", default='mturk_input.csv')
    parser.add_argument("-id", "--id-key", default='question_id')
    args = parser.parse_args()

    dest = args.output_review_file

    question_jsons = get_json_list(args.question_file)
    answer_jsons = [get_json_list(answer_file) for answer_file in args.answer_file_list]

    question_ids = set(question[args.id_key] for question in question_jsons)
    question_jsons = sorted(question_jsons, key=lambda x: x[args.id_key])

    def filter_and_sort_answers(jsons):
        return sorted(
            [answer for answer in jsons if answer[args.id_key] in question_ids],
            key=lambda x: x[args.id_key]
        )
    
    answer_jsons = [filter_and_sort_answers(answer_json) for answer_json in answer_jsons]

    # check if # of questions, answers are the same
    assert all(len(question_jsons) == len(answer_json) for answer_json in answer_jsons)

    total_len = len(question_jsons)
    question_idx_list = list(range(total_len))

    tasks = []

    for question, *answers in zip(question_jsons, *answer_jsons):
        assert all(
            question[args.id_key]
            == a[args.id_key]
            for a in answers
        )

        def process_answer(answer_json):
            return {
                "model_id": answer_json["model_id"],
                "response_id": answer_json["answer_id"],
                "text": answer_json["text"],
            }
        
        responses = [process_answer(answer) for answer in answers]
        metrics = args.metrics

        task = {
            "question": question,
            "responses": responses,
            "metrics": metrics,
        }
        tasks.append(task)

    with open(dest, "w", newline='') as output_csv:
        writer = csv.writer(output_csv)
        writer.writerow(['data'])
        for task in tasks:
            writer.writerow([json.dumps(task)])

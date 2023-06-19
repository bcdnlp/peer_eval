def prompt_review_generation(question, answer_1, answer_2):
    sys_prompt = "You are a helpful and precise assistant for checking the quality of the answer.\n"
    prompt = ("[Question]\n"
              f"{question}\n\n"
              "[The Start of Answer 1]\n"
              f"{answer_1}\n\n"
              "[The End of Answer 1]\n\n"
              "[The Start of Answer 2]\n"
              f"{answer_2}\n\n"
              "[The End of Answer 2]\n\n"
              "[System]\n"
              "We would like to request your feedback on the performance of two answers in response to the user question displayed above.\n"
              "Firstly, please compare two answers and provide a comprehensive explanation of your evaluation, avoiding any potential bias and ensuring that the order in which the responses were presented does not affect your judgment.\n"
              "Once you have carefully reviewed both submissions, in a new line, choose between the two answers by outputting the number 1 or 2 respectively. Do not output anything else other than the number in this last line."
              )
#              "Firstly, please compare the two answers based on if they contain unsupported infomation, core information, and coherence. Please provide a comprehensive explanation of your evaluation, avoiding any potential bias and ensuring that the order in which the responses were presented does not affect your judgment.\n"

    return sys_prompt, prompt

def prompt_discuss_generation(reviewers,
                              question,
                              answer_1,
                              answer_2,
                              justification_1,
                              justification_2,
                              ):
    sys_prompt_1 = f"You are reviewer 1, discussing with reviewer 2 about your reviews of the following answers.\n"
    sys_prompt_2 = f"You are reviewer 2, discussing with reviewer 1 about your reviews of the following answers.\n"
    sys_prompts = [sys_prompt_1, sys_prompt_2]

    prompt = ("[Question]\n"
              f"{question}\n\n"
              "[The Start of Answer 1]\n"
              f"{answer_1}\n\n"
              "[The End of Answer 1]\n\n"
              "[The Start of Answer 2]\n"
              f"{answer_2}\n\n"
              "[The End of Answer 2]\n\n"
              "[The Start of Reviewer 1's Evaluation]\n"
              f"{justification_1}\n\n"
              "[The End of Reviewer 1's Evluation]\n\n"
              "[The Start of Reviewer 2's Evaluation]\n"
              f"{justification_2}\n\n"
              "[The End of Reviewer 2's Evluation]\n\n"
              "[System]\n"
              "Read the reviews and discussions above, and make a decision if to change your preference, and explain.\n"
              "In a new line, choose between the two answers by outputting the number 1 or 2. Do not output anything else other than the number in this last line."
              )
#              "Read the reviews and discussions above, and make a decision if to change your preference, and explain. Remember we focus on unsupported information, core information and coherence.\n"

    histories = []
    for sys_prompt, reviewer in zip(sys_prompts, reviewers):
        if 'claude' == reviewer:
            sys_prompt = ''.join([sys_prompt, prompt])
            histories.append([sys_prompt])
        elif 'gpt4' == reviewer:
            histories.append([sys_prompt, prompt])

    return histories


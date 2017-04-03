import os
import csv
import sys

import discern_survey

# Folder holding the answers
answer_dir = "answer-csvs/"
# Folder holding clean data
source_clean = "new-clean/"
# Folder where the final files should go
destination = "new-data/"

print("Starting evaluation of questions...")

for filename in os.listdir(source_clean):
    print(filename)
    survey = discern_survey.name(filename)
    survey_type = discern_survey.parse_type(filename)

    # 0) Check for answers file
    answer_file = ''.join([answer_dir, survey, "-answers.csv"])
    if (not os.path.exists(answer_file)):
        print(answer_file + " was not found. Exiting...")
        exit()

    answers = open(answer_file, 'r');
    answer_reader = csv.reader(answers)
    for answer_row in answer_reader:
        answer_list = list(answer_row)

    # 1) Go through output csv
    destination_file = ''.join([destination, survey, "-", survey_type,
        "-responses.csv"])
    out = open(destination_file, 'w')

    with open(source_clean + filename, 'r') as f:
        # 2) Look at all answers for each question to generate choices
        reader = csv.reader(f)

        scores = []
        for row in reader:
            entry = list(row)
            if (len(entry) != len(answer_list)):
                # answer and row lengths don't match
                print("Answer and row lengths don't match!")
                print("Row:")
                print(len(entry))
                print("Answer:")
                print(len(answer_list))
                exit()
            score = 0
            for i in range(0,len(entry)):
                if entry[i] == answer_list[i]:
                    score += 1
                #else:
                #    print("Got " + entry[i])
                #    print("Expected " + answer_list[i])
            # Scores in order
            scores.append(score)
        #survey_type = raw_input("Plain / Machine / Hand? ")
        for i in range(0,len(scores)):
            out.write(str(scores[i]))
            out.write(',')
            out.write(survey_type)
            out.write('\n')
        out.close()
        answers.close()
        f.close()

print("Question evaluation done!")

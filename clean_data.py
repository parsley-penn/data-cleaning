import os
import csv
import sys

import discern_survey

# Folder with raw CSVs from Qualtrics
source_csvs = "new-csvs/"
# Folder for cleaned data
destination = "new-clean/"

print("Starting data clean...")

for filename in os.listdir(source_csvs):
    survey = discern_survey.name(filename)
    survey_type = discern_survey.parse_type(filename)

    output_file = ''.join([survey, '-', survey_type, '.csv'])

    out = open(destination + output_file, 'w')
    writer = csv.writer(out)
    # Open the CSV file from args
    with open(source_csvs + filename, 'r') as f:
        # Get the total number of rows
        row_count = sum(1 for row in f)
        # Go from row[4] to row_count+1
        i = 0
        # Reset the seeker
        f.seek(0)
        reader = csv.reader(f)
        for row in reader:
            # Ignore the 3 header rows
            if i in range(4,row_count+1):
                # Check to see if the row is a non-response; if so, skip
                if (len(row[20]) == 0):
                    continue
                # Ignore the first 20 columns and the last one
                writer.writerow(row[20:-1])
            i = i + 1
        f.close()
    out.close()

print("Data cleaning complete!")


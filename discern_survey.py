def name(filename):
    filename = filename.lower()
    # figure out survey and type
    if ("japanese" in filename):
        survey = "japanese"
    elif ("purina" in filename):
        survey = "purina"
    elif ("thomas" in filename):
        survey = "thomas"
    elif ("veraldi" in filename):
        survey = "veraldi"
    elif ("waertsilae" in filename):
        survey = "waertsilae"
    elif ("watches" in filename):
        survey = "watches"
    else:
        survey = "undefined_survey"
    return survey

def parse_type(filename):
    filename = filename.lower()
    if ("hand" in filename):
        survey_type = "hand"
    elif ("plain" in filename):
        survey_type = "plain"
    elif ("machine" in filename):
        survey_type = "machine"
    else:
        survey_type = "undefined_type"
    return survey_type


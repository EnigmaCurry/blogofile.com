#Replace objectionable language with kittens.
#This is just an example, it's far from exhaustive.
import re

seven_words = re.compile(r"\Wshit\W|\Wpiss\W|\Wfuck\W|\Wcunt\W|\Wcocksucker\W|\Wmotherfucker\W|\Wtits\W",re.IGNORECASE)

def run(content):
    return seven_words.sub(" kitten ", content)

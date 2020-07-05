#!/usr/bin/env python3

import os
import sys
import random
import pickle

# Dictionary mapping a 5-digit key (with each digit between 1 and 6) to a word.
DICTIONARY = os.path.join(os.path.dirname(sys.argv[0]), 'diceware.p')
DICTIONARY_KEY_LENGTH = 5
WORDS_PER_PASSPHRASE = 7

def generate_word_from_dictionary():
    key = [str(random.randint(1, 6)) for i in range(DICTIONARY_KEY_LENGTH)]
    key = ''.join(key)
    with open(DICTIONARY, 'rb') as f:
        dictionary = pickle.load(f)
        word = dictionary[key]
        return word

def generate_passphrase():
    random_words = [generate_word_from_dictionary()
                    for i in range(WORDS_PER_PASSPHRASE)]
    random_words = map(str.capitalize, random_words)
    passphrase = ''.join(random_words)
    return passphrase

if __name__ == '__main__':
    print(generate_passphrase())

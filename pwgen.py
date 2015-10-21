#! /usr/bin/env python3
from random import randrange, choice, sample

# no y/z WRT American keyboard layout
uppercase_letters = "ABCDEFGHIJKLMNOPQRSTUVWX"
lowercase_letters = "abcdefghijklmnopqrstuvwx"
numbers = "1234567890"
special_chars = ".,"
alphanumerical = "".join([uppercase_letters, lowercase_letters, numbers])
charcount = 10

def generate_password():
    special_char_pos = randrange(charcount - 3) + 1
    pwstr = choice(uppercase_letters)
    pwstr += "".join(sample(alphanumerical, special_char_pos - 1))
    pwstr += choice(special_chars)
    pwstr += choice(lowercase_letters)
    pwstr += "".join(sample(alphanumerical, charcount - special_char_pos - 3))
    pwstr += choice(numbers)
    return pwstr

if __name__ == "__main__":
    for i in range(15):
        print(generate_password())


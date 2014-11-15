from random import randrange

allowed_chars =\
"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\
1234567890+-*/.,_:;!?"

pwstr = ""
for i in range(20):
    pwstr += allowed_chars[randrange(0, len(allowed_chars))]
print(pwstr)


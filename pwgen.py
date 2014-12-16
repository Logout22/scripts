from random import choice

allowed_chars =\
"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\
1234567890+-*/.,_:;!?"

pwstr = ""
for i in range(20):
    pwstr += choice(allowed_chars)
print(pwstr)

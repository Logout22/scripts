from subprocess import call
from sys import stdin, stderr

idx = 0
datei = open("dupes", "r")
lines = datei.readlines()
datei.close()
dellist = open("dellist", "a")
for line in lines:
    words = line.split()
    for word in words:
        stderr.write("%s\n" % word)
        call("gthumb %s 2>/dev/null" % word, shell=True)
    stderr.write("Keep which?\n")
    inline = str(stdin.readline()).strip()
    try:
        inline.index("e")
        break
    except ValueError:
        pass
    try:
        indices = [ int(i) for i in inline.split() ]
    except ValueError:
        break
    indices.sort(reverse = True)
    for i in indices:
        del words[i]
    for word in words:
        dellist.write("%s\n" % word)
        dellist.flush()
    idx += 1
datei = open("dupes", "w")
datei.writelines(lines[idx:])


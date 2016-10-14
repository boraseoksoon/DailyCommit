data = """
park 800905-1049118
kim  700905-1059119
Jang 870905-1058323
Lee  730905-1355328
"""


print "******* regex NOT used version *******"
result = []
for line in data.split("\n"):
    word_result = []
    for word in line.split(" "):
        if len(word) == 14 and word[:6].isdigit() and word[7:].isdigit():
            word = word[:6] + "-" + "*******"
        word_result.append(word)
    result.append(" ".join(word_result))
print("\n" .join(result))

print "******* regex used version *******"

import re

pat = re.compile("(\d{6})[-]\d{7}")
print(pat.sub("\g<1>-*******", data))


p = re.compile('[a-z]+')
m = p.match( 'python' )
# m = p.search( '3 python' )
# m = p.findall('life is too short')
if m:
    print('Match found: ', m.group())
else:
    print('No match')
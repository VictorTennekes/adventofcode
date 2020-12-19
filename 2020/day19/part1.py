import re

lines = open("input.txt", "r").read().split("\n")

rules = dict()

def resolve_token(token):
	if token[0] == '"':
		return token[1]
	elif token == '|':
		return '|'
	else:
		return '(' + resolve(token) + ')'

def resolve(num_string):
	return ''.join(resolve_token(token) for token in rules[num_string])

words = []

for line in lines:
	if ':' in line:
		name, content = line.split(':')
		rules[name] = content.strip().split()
	else:
		words.append(line)

regexExpr = resolve('0')
print(sum(1 for word in words if re.match('^' + regexExpr + '$', word)))
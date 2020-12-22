import re

lines = open("input.txt", "r").read().split("\n")
inParen = "\(([^()]*)\)"
ret = 0
for i in lines:
	while re.search(inParen, i):
		match = re.search(inParen, i)
		expr = match[1].split(" ")
		res = int(expr[0])
		for j in range(2, len(expr), 2):
			if expr[j - 1] == "+":
				res += int(expr[j])
			else:
				res *= int(expr[j])
		i = i[:match.span(0)[0]] + str(res) + i[match.span(0)[1]:]
	expr = i.split(" ")
	res = int(expr[0])
	for j in range(2, len(expr), 2):
		if expr[j - 1] == "+":
			res += int(expr[j])
		else:
			res *= int(expr[j])
	ret += res
print(ret)

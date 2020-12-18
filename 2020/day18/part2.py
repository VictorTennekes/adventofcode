import re

lines = open("input.txt", "r").read().split("\n")
inParen = "\(([^()]*)\)"
ret = 0
for i in lines:
	while re.search(inParen, i):
		match = re.search(inParen, i)
		expr = match[1].split(" ")
		while "+" in expr:
			plusPos = expr.index("+")
			expr[plusPos] = int(expr[plusPos - 1]) + int(expr[plusPos + 1])
			del expr[plusPos + 1]
			del expr[plusPos - 1]
		while "*" in expr:
			plusPos = expr.index("*")
			expr[plusPos] = int(expr[plusPos - 1]) * int(expr[plusPos + 1])
			del expr[plusPos + 1]
			del expr[plusPos - 1]
		i = i[:match.span(0)[0]] + str(expr[0]) + i[match.span(0)[1]:]
	expr = i.split(" ")
	while "+" in expr:
			plusPos = expr.index("+")
			expr[plusPos] = int(expr[plusPos - 1]) + int(expr[plusPos + 1])
			del expr[plusPos + 1]
			del expr[plusPos - 1]
	while "*" in expr:
		plusPos = expr.index("*")
		expr[plusPos] = int(expr[plusPos - 1]) * int(expr[plusPos + 1])
		del expr[plusPos + 1]
		del expr[plusPos - 1]
	ret += expr[0]
print(ret)
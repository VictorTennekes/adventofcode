import re

bags = {}
for i in open("input.txt", "r").read().replace(".", "").replace(" bags", "").replace(" bag", "").split("\n"):
	values = re.split(", | contain |", i)
	bags[values[0]] = values[1:len(values)]
stack = bags['shiny gold']
res = 0
while len(stack) != 0:
	item = stack.pop()
	try:
		stack += bags[item[2:]] * int(item[0:2])
		res += int(item[0:2])
	except:
		continue
print(res)
bags = open("input.txt", "r").read().split("\n")

hasGold = [False] * len(bags)
stack = [i for i in range(len(bags)) if bags[i].find('shiny gold', 1) != -1]
while len(stack):
	index = stack.pop()
	if hasGold[index] == True:
		continue
	hasGold[index] = True
	name = bags[index][:bags[index].find('bag') - 1]
	for i in range(len(bags)):
		if bags[i] and bags[i].find(name, 1) != -1:
			stack.append(i)
print(sum(hasGold))
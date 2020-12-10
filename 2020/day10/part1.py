values = sorted([int(i) for i in open("input.txt", "r").read().split("\n")])
one = 1
three = 1
for i in range(1, len(values)):
	if values[i] - values[i - 1] == 1:
		one += 1
	elif values[i] - values[i - 1] == 3:
		three += 1
print(one * three)
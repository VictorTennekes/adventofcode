lines = open("input.txt", "r").read().split("\n")
line_len = len(lines[0])
trees = 0
j = 3
for i in range(1, len(lines)):
	if lines[i][j % line_len] == '#':
		trees += 1
	j += 3
print(trees)
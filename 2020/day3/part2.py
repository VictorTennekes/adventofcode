import math

lines = open("input.txt", "r").read().split("\n")
slopes = [1, 3, 5, 7]
line_len = len(lines[0])
trees = [0] * 5
count = 1
for i in range(1, len(lines)):
	if not (i % 2):
		if lines[i][(i - count) % line_len] == '#':
			trees[4] += 1
		count += 1
	for q in range(len(slopes)):
		if lines[i][(i * slopes[q]) % line_len] == '#':
			trees[q] += 1
print(math.prod(trees))
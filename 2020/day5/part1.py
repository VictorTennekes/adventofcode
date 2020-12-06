passes = open("input.txt", "r").read().split("\n")
res = 0
for tick in passes:
	row = [0, 127]
	for i in range(7):
		if tick[i] == "B":
			row[0] += ((row[1] - row[0]) // 2) + 1
		else:
			row[1] -= ((row[1] - row[0]) // 2) + 1
	col = [0, 7]
	for i in range(7, 10):
		if tick[i] == "R":
			col[0] += ((col[1] - col[0]) // 2) + 1
		else:
			col[1] -= ((col[1] - col[0]) // 2) + 1
	value = (row[0] * 8) + col[1]
	if (value > res):
		res = value
print(res)
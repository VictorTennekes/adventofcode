passes = open("input.txt", "r").read().split("\n")
ids = []
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
	ids.append((row[0] * 8) + col[1])
ids = sorted(ids)
last = ids[0]
for i in range(1, len(ids)):
	if ids[i] - last == 2:
		print(last + 1)
		quit()
	last = ids[i]
def seatOcc(seats, y, x):
	if y < 0 or y > len(seats) - 1:
		return (0)
	elif x < 0 or x > len(seats[0]) - 1:
		return (0)
	else:
		if seats[y][x] == '#':
			return 1
		elif seats[y][x] == 'L':
			return -1
		else:
			return 0

def checkSurroundings(seats, y, x):
	directions = [False] * 8
	count = 0
	for i in range(1, max(len(seats), len(seats[y]))):
		if directions[0] == False:
			found = seatOcc(seats, y + i, x)
			if found == 1 or found == -1:
				if found == 1:
					count += 1
				directions[0] = True							
		if directions[1] == False:
			found = seatOcc(seats, y - i, x)
			if found == 1 or found == -1:
				if found == 1:
					count += 1
				directions[1] = True							
		if directions[2] == False:
			found = seatOcc(seats, y, x + i)
			if found == 1 or found == -1:
				if found == 1:
					count += 1
				directions[2] = True							
		if directions[3] == False:
			found = seatOcc(seats, y, x - i)
			if found == 1 or found == -1:
				if found == 1:
					count += 1
				directions[3] = True							
		if directions[4] == False:
			found = seatOcc(seats, y + i, x + i)
			if found == 1 or found == -1:
				if found == 1:
					count += 1
				directions[4] = True							
		if directions[5] == False:
			found = seatOcc(seats, y + i, x - i)
			if found == 1 or found == -1:
				if found == 1:
					count += 1
				directions[5] = True							
		if directions[6] == False:
			found = seatOcc(seats, y - i, x + i)
			if found == 1 or found == -1:
				if found == 1:
					count += 1
				directions[6] = True							
		if directions[7] == False:
			found = seatOcc(seats, y - i, x - i)
			if found == 1 or found == -1:
				if found == 1:
					count += 1
				directions[7] = True							
	return (count)

def simulate(seats):
	changes = 0
	tmp = []
	for i in range(0, len(seats)):
		line = ""
		for j in range(0, len(seats[i])):
			num = checkSurroundings(seats, i, j)
			if seats[i][j] == '#' and num >= 5:
				line += 'L'
				changes += 1
			elif seats[i][j] == 'L' and num == 0:
				line += '#'
				changes += 1
			else:
				line += seats[i][j]
		tmp.append(line)
	return changes, tmp

seats = open("input.txt", "r").read().replace("L", "#").split("\n")
changes = 1
while changes != 0:
	changes, seats = simulate(seats)
print(sum(i.count("#") for i in seats))
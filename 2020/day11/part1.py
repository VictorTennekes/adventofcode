def seatOcc(seats, y, x):
	if y < 0 or y > len(seats) - 1:
		return (0)
	elif x < 0 or x > len(seats[0]) - 1:
		return (0)
	else:
		return (1 if seats[y][x] == '#' else 0)


def checkSurroundings(seats, y, x):
	count = 0
	count += seatOcc(seats, y + 1, x)
	count += seatOcc(seats, y - 1, x)
	count += seatOcc(seats, y, x + 1)
	count += seatOcc(seats, y, x - 1)
	count += seatOcc(seats, y + 1, x + 1)
	count += seatOcc(seats, y + 1, x - 1)
	count += seatOcc(seats, y - 1, x + 1)
	count += seatOcc(seats, y - 1, x - 1)
	return (count)

def simulate(seats):
	changes = 0
	tmp = []
	for i in range(0, len(seats)):
		line = ""
		for j in range(0, len(seats[i])):
			num = checkSurroundings(seats, i, j)
			if seats[i][j] == '#' and num >= 4:
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
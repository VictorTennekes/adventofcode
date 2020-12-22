tiles = open("input.txt", "r").read().split("\n\n")
tileSides = dict()

def CheckSides(tileId):
	connectionIds = set()
	for i in tileSides[tileId]:
		for j in tileSides:
			if i in tileSides[j] and j != tileId:
				connectionIds.add(j)
	return(connectionIds)

for tile in tiles:
	sides = []
	tile = tile.split('\n')
	left = right = ""
	for i in range(1, len(tile)):
		left += tile[i][0]
		right += tile[i][-1]
	sides += [tile[1], tile[1][::-1]]
	sides += [tile[-1], tile[-1][::-1]]
	sides += [left, left[::-1]]
	sides += [right, right[::-1]]
	tileSides[tile[0][5:-1]] = sides
connections = dict()

for i in tileSides:
	connections[i] = CheckSides(i)
	
res = 1
for i in connections:
	if len(connections[i]) == 2:
		res *= int(i)
print(res)
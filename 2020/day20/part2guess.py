tiles = open("input.txt", "r").read().split("\n\n")
tileSides = dict()

# used to make a rough estimate of how many dragons could be there
# for i in tiles:
# 	tile = i.split("\n")
# 	for j in range(2, len(tile[0]) - 1):
# 		res += tile[j][1:-1].count("#")

# print(res - (15 * 18))

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

# 1896 < x < 1906


# figure out where pieces belong jusged by connections then rotate until done
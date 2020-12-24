tiles = open("input.txt", "r").read().split("\n")

black_tiles = set()

def returnNeighbours(x, y):
	return ((x+1,y), (x-1,y), (x+0.5, y+0.5), (x-0.5, y+0.5), (x+0.5, y-0.5), (x-0.5, y-0.5))

def checkNeighbours(neighbs):
	return(sum(1 for i in neighbs if i in black_tiles))

for tile in tiles:
	x,y = 0, 0
	i = 0
	while i < len(tile):
		if tile[i] == 'e':
			x += 1
		elif tile[i] == 'w':
			x -= 1
		elif tile[i] == 'n':
			if tile[i + 1] == 'w':
				y += 0.5
				x -= 0.5
			elif tile[i + 1] == 'e':
				y += 0.5
				x += 0.5
			i += 1
		elif tile[i] == 's':
			if tile[i + 1] == 'w':
				y -= 0.5
				x -= 0.5
			elif tile[i + 1] == 'e':
				y -= 0.5
				x += 0.5
			i += 1
		i += 1
	if (x, y) in black_tiles:
		black_tiles.remove((x, y))
	else:
		black_tiles.add((x, y))

new_tiles = set()

for _ in range(100):
	next_tiles = set()
	for i in black_tiles:
		neighbs = returnNeighbours(i[0], i[1])
		count = checkNeighbours(neighbs)
		if count in [1, 2]:
			next_tiles.add(i)
		for j in neighbs:
			localNeighbs = returnNeighbours(j[0], j[1])
			if checkNeighbours(localNeighbs) == 2:
				new_tiles.add(j)
				next_tiles.add(j)
	black_tiles = next_tiles
print(len(black_tiles))
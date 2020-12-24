tiles = open("input.txt", "r").read().split("\n")

black_tiles = set()

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
print(len(black_tiles))
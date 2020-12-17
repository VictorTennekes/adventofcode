grid = open("input.txt", "r").read().split("\n")
w = len(grid[0]); h = len(grid)

cubes = set()
for y in range(h):
	for x in range(w):
		if grid[y][x] == '#':
			cubes.add((x, y, 0, 0))

def neighbours(x, y, z, w):
	for dx in (-1, 0, 1):
		for dy in (-1, 0, 1):
			for dz in (-1, 0, 1):
				for dw in (-1, 0, 1):
					if dx == dy == dz == dw == 0: continue
					yield (x+dx, y+dy, z+dz, w+dw)

def countNeighbours(x, y, z, w):
	c = 0
	for p in neighbours(x, y, z, w):
		c += p in cubes
	return c

def step():
	ncubes = set()
	for p in cubes:
		for n in neighbours(*p):
			if n not in cubes and countNeighbours(*n) == 3:
				ncubes.add(n)
		if countNeighbours(*p) in (2, 3):
			ncubes.add(p)
	return ncubes

for i in range(6):
	cubes = step()

print(len(cubes))
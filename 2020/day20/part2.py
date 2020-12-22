
def read_tiles(input_file):
	tiles = {}
	for raw_tile in open(input_file, "r").read().split("\n\n"):
		name, *lines = raw_tile.split("\n")
		num = int(name[5:-1])
		tiles[num] = Tile(lines)
	return(tiles)

def set_connec(tiles):
	for i in tiles:
		for j in tiles:
			if i == j:
				continue
			else:
				tiles[i].set_connects(tiles[j], j)
			

class Tile:
	def __init__(self, par):
		self.body = par
		self.edges = [
			par[0],
			par[-1],
			self.firsts(),
			self.lasts(),
		]
		self.connec = {}
	def lasts(self):
		return(''.join(i[-1] for i in self.body))

	def firsts(self):
		return ''.join(i[0] for i in self.body)

	def set_connects(self, tile, id):
		for i in range(4):
			for j in range(4):
				if self.edges[j] == tile.edges[i]:
					if self.connec[id]:
						self.connec[id].append(i)
					else:
						self.connec[id] = [i]
				if self.edges[j][::-1] == tile.edges[i]:
					if self.connec[id]:
						self.connec[id].append(i + 'F')
					else:
						self.connec[id] = [i + 'F']

def main():
	tiles = read_tiles("input.txt")
	set_connec(tiles)
	for i in tiles:
		print(tiles[i])
		quit()

main()
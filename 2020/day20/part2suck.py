from collections import defaultdict
from enum import Enum
import math
import re

class Edge(Enum):
	TOP = 0
	BOT = 1
	LEFT = 2
	RIGHT = 3

class Tile:
	def __init__(self, par):
		self.body = par
		self.edges = [
			par[0],
			par[-1],
			self.firsts(),
			self.lasts(),
		]
	
	def lasts(self):
		return(''.join(i[-1] for i in self.body))

	def firsts(self):
		return ''.join(i[0] for i in self.body)
	# def rotate:

def all_edges(tile):
	es = tile.edges
	return es + [''.join(reversed(i)) for i in es]

def get_id(s):
    return s[0][5:-1]

data = [i.strip().split("\n") for i in open("test.txt", "r").read().split("\n\n")]
tiles = {}
for tile in data:
	n = get_id(tile)
	tiles[n] = Tile(tile[1:])
	print(n, tiles[n].edges)

N = math.sqrt(len(tiles))

edge_map = defaultdict(list)
for n, tile in tiles.items():
	for e in all_edges(tile):
		edge_map[e].append(n)

corners = []
for n, tile in tiles.items():
	cnt = 0
	for e in tile.edges:
		print(len(edge_map[e]))
		cnt += len(edge_map[e]) - 1
	if cnt == 2:
		corners.append(n)

corner_n = corners[0]
ltile = tiles[corner_n]
while len(edge_map[ltile.edges[2]]) == 2:
		print("HERE")
        # ltile = rotate(ltile)
print(len(edge_map[ltile.edges[2]]))
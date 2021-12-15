# Dijkstra algorithm.
 
from algorithm import reverse
import sets
import strformat
import tables
 
type
  Edge = tuple[src, dst: (int, int); cost: int]
  Graph = object
    vertices: HashSet[(int, int)]
    neighbours: Table[(int, int), seq[tuple[dst: (int, int), cost: float]]]
 
#---------------------------------------------------------------------------------------------------
 
proc initGraph(edges: openArray[Edge]): Graph =
  ## Initialize a graph from an edge list.
  ## Use floats for costs in order to compare to Inf value.
  for (src, dst, cost) in edges:
    result.vertices.incl(src)
    result.vertices.incl(dst)
    result.neighbours.mgetOrPut(src, @[]).add((dst, cost.toFloat))
 
#---------------------------------------------------------------------------------------------------
 
proc dijkstraPath(graph: Graph; first, last: (int, int)): seq[(int, int)] =
  ## Find the path from "first" to "last" which minimizes the cost.
  var dist = initTable[(int, int), float]()
  var previous = initTable[(int, int), (int, int)]()
  var notSeen = graph.vertices
  for vertex in graph.vertices:
    dist[vertex] = Inf
  dist[first] = 0
 
  while notSeen.card > 0:
    # Search vertex with minimal distance.
    var vertex1: (int, int)
    var mindist = Inf
    for vertex in notSeen:
      if dist[vertex] < mindist:
        vertex1 = vertex
        mindist = dist[vertex]
    if vertex1 == last:
      break
    notSeen.excl(vertex1)
    # Find shortest paths to neighbours.
    for (vertex2, cost) in graph.neighbours.getOrDefault(vertex1):
      if vertex2 in notSeen:
        let altdist = dist[vertex1] + cost
        if altdist < dist[vertex2]:
          # Found a shorter path to go to vertex2.
          dist[vertex2] = altdist
          previous[vertex2] = vertex1    # To go to vertex2, go through vertex1.
 
  # Build the path.
  var vertex = last
  while vertex != (0, 0):
    result.add(vertex)
    vertex = previous.getOrDefault(vertex)
  result.add(vertex)
  result.reverse()
 
#---------------------------------------------------------------------------------------------------

include ../aoc

type
 Grid = seq[seq[int]]

let
 input = readFile("input.txt").strip.split("\n")
 directions4 = [(0, 1), (1,0), (0, -1), (-1, 0)]
 h = input.len
 w = input[0].len

func getGrid(input: seq[string]): Grid =
  result = input.mapIt(it.mapIt(parseInt($it)))

let grid = getGrid(input)
var entireList: seq[((int, int), (int, int), int)]

proc getRisk(path: seq[(int, int)]): int =
  for i in path:
    result.inc grid[i[1]][i[0]]

var grid2: seq[seq[int]]
for i in 0..4:
 for r in grid:
  grid2.add r.mapIt((it + i + 8)mod 9 + 1)&r.mapIt((it + i + 0)mod 9 + 1)&r.mapIt((it + i + 1)mod 9 + 1)&r.mapIt((it + i + 2)mod 9 + 1)&r.mapIt((it + i + 3)mod 9 + 1)

for y in 0..<grid2.len:
  for x in 0..<grid2[0].len:
    for (dx,dy) in directions4:
      let X = x+dx
      let Y = y+dy
      if X < 0 or X >= w or Y < 0 or Y >= h:
        continue
      entireList.add ((x, y), (X, Y), grid[Y][X])
      # entireList.add ($x & "," & $y, $X & "," & $Y, grid[Y][X])

var parsedGrid = initGraph(entireList)
let path = parsedGrid.dijkstraPath((0,0), (grid2.len-1, grid2[0].len-1))
echo getRisk(path) - grid[0][0]
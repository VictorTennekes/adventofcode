include prelude
import std/algorithm

let
 input = readFile("test.txt").strip.split("\n").mapIt(toSeq(it).mapIt(parseInt($it)))
 h = input.len
 w = input[0].len

var basins: seq[seq[(int, int)]]
var visited: seq[(int, int)]

proc floodfill(i, y, x: int) =
 basins[i].add((y,x))
 visited.add((y,x))
 for (dx,dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
     let X = x+dx
     let Y = y+dy
     if (X < 0) or (X >= w) or (Y < 0) or (Y >= h) or (Y,X) in visited or input[Y][X] == 9:
         continue
     floodfill(i,Y,X)

var i = 0
for y in 0..<h:
 for x in 0..<w:
  if (y, x) notin visited and input[y][x] != 9:
   basins.add newSeq[(int, int)]()
   floodfill(i, y, x)
   i += 1

basins = basins.sortedByIt(it.len)
echo basins[^3..^1].mapIt(it.len).foldl(a*b)
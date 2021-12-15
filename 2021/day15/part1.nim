include ../aoc

let
 input = readFile("test.txt").strip.split("\n")
 h = input.len
 w = input[0].len
 directions4 = [(0, 1), (1,0), (0, -1), (-1, 0)]
 direction2 = [(1, 0), (0, 1)]

type
 Grid = seq[seq[int]]

func getGrid(input: seq[string]): Grid =
 result = input.mapIt(it.mapIt(parseInt($it)))

let grid = getGrid(input)

proc getPath(): int =
 var x = 0
 var y = 0
 while x < w-1 and y < h-1:
  var min = high(int)
  var pos: (int, int)
  for (dx,dy) in direction2:
   if grid[y+dy][x+dx] < min:
    min = grid[y+dy][x+dx]
    pos = (y+dy, x+dx)
  y = pos[0]
  x = pos[1]
  echo y, " ", x
  echo grid[y][x]
  result.inc grid[y][x]

echo getPath()
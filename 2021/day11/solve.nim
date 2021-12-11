include ../aoc

var
 input = readFile("input.txt").strip.split("\n").mapIt(it.toSeq.mapIt(parseInt($it)))
let
 h = input.len
 w = input[0].len
const
 directions8 = [(0, 1), (1, 0), (0, -1), (-1,0), (1, 1), (-1, 1),(1, -1), (-1, -1)]

proc floodfill(y, x: int, flashed: var HashSet[(int, int)]) =
 input[y][x] = 0
 flashed.incl((y, x))
 for (dx, dy) in directions8:
  let X = x+dx
  let Y = y+dy
  if X < 0 or X >= w or Y < 0 or Y >= h or (Y, X) in flashed:
   continue
  input[Y][X].inc
  if input[Y][X] == 10:
   floodfill(Y, X, flashed)

proc step(): HashSet[(int, int)] =
 for y in 0..<h:
  for x in 0..<w:
   if (y, x) notin result:
    input[y][x].inc
    if input[y][x] == 10:
     floodfill(y, x, result)

proc part1(): int =
 for time in 0..99:
  result += step().len

proc part2(): int =
 var tmp = 0
 var i = 0
 while true:
  i.inc
  tmp = step().len
  if tmp == h * w:
   return i + 100

echo "part 1: ", part1()
echo "part 2: ", part2()
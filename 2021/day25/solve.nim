include ../aoc

let input = readFile("input.txt").strip.split("\n")
let h = input.len
let w = input[0].len

proc apply(field: Grid[char], id: char, dir: Point): Grid[char] =
 result = field
 for y, line in field:
  for x, pos in line:
   if pos == id:
    let p2 = ((x + dir.x) mod w, (y + dir.y) mod h)
    if field[p2] == '.':
     result[p2] = id
     result[y][x] = '.'

proc solve():int =
 var field = input.mapIt(it.toSeq)
 while true:
  result.inc
  var tmp = field.apply('>', (1, 0)).apply('v', (0, 1))
  if tmp == field:
   return
  field = tmp

echo "part 1: ", solve()
include ../aoc

let
 input = readFile("input.txt")
 (_, minX, maxX, minY, maxY) = scanTuple(input, "target area: x=$i..$i, y=$i..$i")

proc hit(coord: Point): bool =
 if coord.x >= minX and coord.x <= maxX and coord.y >= minY and coord.y <= maxY:
  return true
 return false

proc shoot(x, y: int): bool =
 var point: Point = (0, 0)
 var xvel = x
 var yvel = y
 while (point.x <= maxX):
  if hit(point):
   return true
  if point.y < minY:
   break
  point[0].inc xvel
  point[1].inc yvel
  if xvel > 0:
   xvel -= 1
  yvel -= 1
 return false

var hits = 0
for y in minY..minX:
 for x in 1..maxX:
  if shoot(x, y):
   hits.inc

echo (minY)*(minY+1) div 2
echo hits
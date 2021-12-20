include ../aoc

type Grid = HashSet[Point]
type
  Img = object
    grid: Grid
    minX,maxX,minY,maxY: int

var image: Img
let input = readFile("input.txt").split("\n")
let alg = input[0]

proc setVal(img: var Img, x, y: int) =
 img.grid.incl((x, y))
 img.minX = min(x, img.minX)
 img.maxX = max(x, img.maxX)
 img.minY = min(y, img.minY)
 img.maxY = max(y, img.maxY)

for y, line in input[2..^1]:
 for x, c in line:
  if c == '#':
   image.setVal(x, y)

proc getValue(img: Img, point: Point, whiteOutside: bool): int =
 for (dy,dx) in directions9:
  let X = point.x + dx
  let Y = point.y + dy
  if whiteOutside and (Y < img.minY or Y > img.maxY or X < img.minX or X > img.maxX):
   result = (result shl 1) or 1
  else:
   result = (result shl 1) or ((X,Y) in img.grid).ord

proc enhance(alg: string, img: var Img, repeat: int) =
 var img2: Img
 for r in 0..<repeat:
  let whiteOutside = alg[0] == '#' and r mod 2 == 1
  for y in img.minY-1..img.maxY+1:
   for x in img.minX-1..img.maxX+1:
    let n = img.getValue((x,y), whiteOutside)
    if alg[n] == '#':
     img2.setVal(x, y)
  (img, img2) = (img2, Img())

alg.enhance(image, 2)
echo "Part 1: ", image.grid.len
alg.enhance(image, 50-2)
echo "Part 2: ", image.grid.len
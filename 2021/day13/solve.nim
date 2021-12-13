include ../aoc

let
 input = readFile("input.txt").strip.split("\n\n")
 folds = input[1].split("\n")
var topY, topX = 0

type Point = (int, int)

var points: HashSet[Point]

proc printMap(topY, topX: int) =
 for y in 0..topY:
  var line = ""
  for x in 0..topX:
   if (y, x) in points: line &= "█"
   else: line &= " "
  echo line

func fold(points: HashSet[Point], foldvalue: int, dimensionX: bool): HashSet[Point] =
 for dot in points:
  if dimensionX and dot[1] > foldvalue:
   result.incl (dot[0], foldvalue*2 - dot[1])
  elif not dimensionX and dot[0] > foldvalue:
   result.incl  (foldvalue*2 - dot[0], dot[1])
  else:
   result.incl dot

for i in input[0].split("\n"):
 let (ok, x, y) = scanTuple(i, "$i,$i")
 if ok:
  points.incl (y, x)

for index in 0..folds.high:
 let (ok, axis, value) = scanTuple(folds[index], "fold along $*=$i")
 if ok:
  if axis == "x":
   points = fold(points, value, true)
   topX = value-1
  else:
   topY = value-1
   points = fold(points, value, false)
 if index == 0:
  echo "part 1: ", points.len

echo "part 2:"
printMap(topY, topX)
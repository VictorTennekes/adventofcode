include prelude
import std/strscans

func sign(x: int): int =
 result = 0
 if x > 0:
  result = 1
 elif x < 0:
  result = -1

type
 Point = object
  x: int
  y: int

let input = readFile("input.txt").strip.split("\n")

var res2 = initTable[Point, int]()
var res1 = initTable[Point, int]()

for line in input:
 var (ok, x1, y1, x2, y2) = line.scanTuple("$i,$i -> $i,$i")
 var sx = sign(x2-x1)
 var sy = sign(y2-y1)
 var dist = max(abs(x2-x1), abs(y2-y1))
 for p in 0..dist:
   var point = Point(x: x1+(sx*p), y: y1+(sy*p))
   if not res2.hasKey(point):
    res1[point] = 0
    res2[point] = 0
   inc res2[point]
   if sx == 0 or sy == 0:
    inc res1[point]

var sum1, sum2 = 0
for i in res1.values:
 if i > 1: inc sum1
for i in res2.values:
 if i > 1: inc sum2

echo "part 1: ", sum1
echo "part 2: ", sum2
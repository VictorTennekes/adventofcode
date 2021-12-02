include prelude
import std/strscans

let input = readFile("input.txt").strip.splitLines

proc part1() : int =
 var x, y = 0
 for line in input:
  var (succes, direction, value) = scanTuple(line, "$+ $i")
  if succes:
   case direction:
    of "forward":
     x += value
    of "down":
     y += value
    of "up":
     y -= value
 return x * y

proc part2() : int =
 var x, y, aim = 0
 for line in input:
  var (succes, direction, value) = scanTuple(line, "$+ $i")
  if succes:
   case direction:
    of "forward":
     x += value
     y += aim * value
    of "down":
     aim += value
    of "up":
     aim -= value
 return x * y

echo "part 1: ", part1()
echo "part 2: ", part2()
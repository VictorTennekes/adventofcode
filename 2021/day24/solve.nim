include ../aoc

let input = readFile("input.txt").strip.split("\n")

var ins: seq[seq[int]]
for index in 0..13:
 let app = input[index*18..<(index+1)*18]
 var lines = app.mapIt(it.split)
 ins.add [lines[4][2], lines[5][2], lines[15][2]].map parseInt

var limits: array[14, (int, int)]
var stack: seq[int]
for i, rule1 in ins:
 if rule1[0] == 1:
  stack.add i
 else:
  var j = stack.pop
  var rule2 = ins[j]
  var diff = rule2[2] + rule1[1]
  if diff < 0:
   limits[j] = (1-diff,9)
   limits[i] = (1,9+diff)
  else:
   limits[j] = (1,9-diff)
   limits[i] = (1+diff,9)

echo "part 1: ", limits.mapIt(it[1]).join
echo "part 1: ", limits.mapIt(it[0]).join
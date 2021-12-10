include ../aoc

let
 input = readFile("input.txt").strip.split("\n")
const
 closepoints = {')': 3, ']': 57, '}': 1197, '>': 25137}.toTable
 openpoints = {'(': 1, '[': 2, '{': 3, '<': 4}.toTable
 openclose = {'(': ')', '[': ']', '{': '}', '<': '>'}.toTable

proc examineLine(line: string): int =
 var last_open: seq[char]
 for brack in line:
  if brack in openclose:
   last_open.add(brack)
  elif brack == openclose[last_open[^1]]:
   last_open.delete(last_open.high)
  else:
   return closepoints[brack] * -1
 for brack in last_open.reversed:
  result *= 5
  result.inc openpoints[brack]
 
var part1 = 0
var part2: seq[int]
for line in input:
 var val = examineLine(line)
 if val < 0:
  part1.inc val * -1
 else:
  part2.add val

echo "part 1: ", part1
echo "part 2: ", part2.sorted[part2.len div 2]
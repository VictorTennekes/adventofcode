include prelude

let
 input = readFile("input.txt").strip.split("\n")
 points = {')': 3, ']': 57, '}': 1197, '>': 25137}.toTable
 openclose = {'(': ')', '[': ']', '{': '}', '<': '>'}.toTable


proc findError(line: string): int =
 var last_open: seq[char]
 for brack in line:
  if brack in openclose:
   last_open.add(brack)
  elif brack == openclose[last_open[^1]]:
   last_open.delete(last_open.high)
  else:
   result.inc points[brack]
   return

var sum = 0
for line in input:
 sum.inc findError(line)
   
echo sum
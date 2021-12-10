include prelude
import std/algorithm

let
 input = readFile("input.txt").strip.split("\n")
 closepoints = {')': 3, ']': 57, '}': 1197, '>': 25137}.toTable
 openpoints = {'(': 1, '[': 2, '{': 3, '<': 4}.toTable
 openclose = {'(': ')', '[': ']', '{': '}', '<': '>'}.toTable


proc findError(line: string): int =
 var last_open: seq[char]
 for brack in line:
  if brack in openclose:
   last_open.add(brack)
  elif brack == openclose[last_open[^1]]:
   last_open.delete(last_open.high)
  else:
   return -1
 for brack in last_open.reversed:
  result *= 5
  result.inc openpoints[brack]

 

var sum: seq[int]
for line in input:
 let tmp = findError(line)
 if tmp > 0:
  sum.add(tmp)

echo sum.sorted(system.cmp[int])[sum.len div 2]
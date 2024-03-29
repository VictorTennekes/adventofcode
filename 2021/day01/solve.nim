import std/[strutils, sequtils, math, sugar]

const
 input = readFile("input.txt").strip.splitLines.map(parseInt)
 size = len(input)

var second_part = newSeq[int](0)
for i in 0..<size-2:
 second_part.add(sum(input[i..i+2]))

proc solve(values: seq) : int =
 for i in 1..<len(values):
  if values[i] > values[i - 1]:
   result += 1

echo "part 1: ", solve(input)
echo "part 2: ", solve(second_part)
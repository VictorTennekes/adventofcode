import std/[strutils, sequtils, math, sugar]

const input = readFile("input.txt").strip.splitLines.map(parseInt)

proc solve_one(): int =
 for i in input:
  if 2020 - i in input:
   return i * (2020 - i)

proc solve_two(): int =
 for i in input:
  for j in input:
   if 2020 - i - j in input:
    return (i * j * (2020 - i - j))

echo solve_one()
echo solve_two()
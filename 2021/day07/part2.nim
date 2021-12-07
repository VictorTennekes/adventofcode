include prelude

let
 crabs = readFile("input.txt").strip.split(",").map(parseInt)
 size = crabs.len

proc getFuelCosts(crabs: seq[int]): CountTable[int] =
 for crab in crabs:
  for pos in 0..crabs[crabs.maxIndex]:
   var tmp = 0
   for i in 0..abs(crab - pos):
    tmp += i
   result.inc(pos, tmp)

echo getFuelCosts(crabs).smallest()
include prelude

let
 crabs = readFile("input.txt").strip.split(",").map(parseInt)
 size = crabs.len

echo crabs.maxIndex
echo crabs[crabs.maxIndex]

func getFuelCosts(crabs: seq[int]): CountTable[int] =
 for crab in crabs:
  for pos in 0..crabs[crabs.maxIndex]:
   result.inc(pos, abs(crab - pos))

echo getFuelCosts(crabs).smallest()
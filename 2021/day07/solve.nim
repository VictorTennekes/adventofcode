include prelude
import std/algorithm

let
 crabs = readFile("input.txt").strip.split(",").map(parseInt).sorted(system.cmp[int])
 size = crabs.len
 median = crabs[size div 2]
 mean = crabs.foldl(a + b) div size

func cost(x: int): int = x*(x+1) div 2
echo "part 1:", crabs.mapIt(abs(it - median)).foldl(a + b)
echo "part 2:", crabs.mapIt(cost(abs(it-mean))).foldl(a + b)
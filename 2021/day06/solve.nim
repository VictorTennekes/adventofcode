include prelude

let input = readFile("input.txt").split(",")
var fish = input.map(parseInt).toCountTable

func nextDay(fish: CountTable[int]): CountTable[int] =
 for a, b in fish:
  if a == 0:
   result.inc(8, b)
   result.inc(6, b)
  else:
   result.inc(a - 1, b)

for i in 0..<256:
 if i == 80:
  echo "part 1: ", mvalues(fish).toSeq.foldl(a + b)
 fish = nextDay(fish)

echo "part 2: ", mvalues(fish).toSeq.foldl(a + b)
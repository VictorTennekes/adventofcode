include prelude

let input = readFile("input.txt").split(",")
var fish = input.map(parseInt).toCountTable

func nextDay(fish: CountTable[int]): CountTable[int] =
 for i in 0..8:
  result[i] = 0
 for i, cnt in fish:
  if i > 0:
   result.inc(i-1, cnt)
  else:
   result.inc(8, cnt)
   result.inc(6, cnt)
 return (result)

for i in 0..<256:
 if i == 80:
  echo "part 1: ", mvalues(fish).toSeq.foldl(a + b)
 fish = nextDay(fish)

echo "part 2: ", mvalues(fish).toSeq.foldl(a + b)
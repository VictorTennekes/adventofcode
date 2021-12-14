include ../aoc

let input = readFile("test.txt").strip.split("\n\n")
var poly = input[0]

func getRules(rules: seq[string]): Table[string, string] =
 for line in rules:
  let (_,x,y) = scanTuple(line, "$+ -> $+")
  result[x] = y

let rules = getRules(input[1].split("\n"))

proc increase(pairs: CountTable[string]): CountTable[string] =
 for k,v in pairs:
  result.inc(k[0] & rules[k], v)
  result.inc(rules[k] & k[1], v)

proc solve(pairs: CountTable[string], times: int): int =
 var pairs = pairs
 var res: CountTable[char]
 for i in 0..<times:
  pairs = increase(pairs)
 for k,v in pairs:
  res.inc(k[0], v)
 res.inc(poly[^1], 1)
 result = (res.largest[1] - res.smallest[1])

var pairs: CountTable[string]
for (a,b) in zip(poly, poly[1..^1]):
 pairs.inc(a&b)

echo "part 1: ", solve(pairs, 10)
echo "part 2: ", solve(pairs, 40)
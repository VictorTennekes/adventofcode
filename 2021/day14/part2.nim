include ../aoc

let input = readFile("input.txt").strip.split("\n\n")
var polymer = input[0]

func getRules(rules: seq[string]): Table[string, string] =
 for line in rules:
  let (_,pair,mid) = scanTuple(line, "$+ -> $+")
  result.mgetOrPut(pair, "") = mid

let rules = getRules(input[1].split("\n"))
var pairs: CountTable[string]
for index in 0..<polymer.high:
 pairs.inc(polymer[index]&polymer[index+1])

for time in 0..39:
 var tmpTable: CountTable[string]
 for i in pairs.keys:
  tmpTable.inc(i[0]&rules[i], pairs[i])
  tmpTable.inc(rules[i]&i[1], pairs[i])
 pairs = tmpTable

var res: CountTable[char]
for i in pairs.keys:
 res.inc(i[0], pairs[i])
 res.inc(i[1], pairs[i])

echo (res.largest[1] - res.smallest[1]) div  2
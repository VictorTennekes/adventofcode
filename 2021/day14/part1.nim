include ../aoc

let
 input = readFile("input.txt").strip.split("\n\n")

var polymer = input[0]

func getRules(rules: seq[string]): Table[string, string] =
 for line in rules:
  let (_,pair,mid) = scanTuple(line, "$+ -> $+")
  result.mgetOrPut(pair, "") = mid

var rules = getRules(input[1].split("\n"))
for time in 0..9:
 var tmpPoly = ""
 for index in 0..<polymer.high:
  tmpPoly &= polymer[index] & rules[polymer[index]&polymer[index+1]]
 tmpPoly  &= polymer[^1]
 polymer = tmpPoly

let answer = polymer.toCountTable
echo answer.largest[1] - answer.smallest[1]
include prelude

let
 input = readFile("input.txt").strip.split("\n")
 size = input.len

var tmp: seq[string]
for line in input:
 tmp.add(line.split("|")[1].strip.split(" "))
tmp = tmp.filterIt(it.len == 2 or it.len == 3 or it.len == 4 or it.len == 7)
echo tmp.len
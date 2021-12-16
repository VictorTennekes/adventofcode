include ../aoc

let
 input = readFile("test.txt").strip.mapIt(fromHex[int]($it).toBin(4)).join

echo input
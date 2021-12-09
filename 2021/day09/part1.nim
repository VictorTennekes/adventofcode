include prelude
import std/algorithm

let
 input = readFile("input.txt").strip.split("\n").mapIt(toSeq(it).mapIt(parseInt($it)))
 inputsize = input.len
 linesize = input[0].len

var res = 0
for y in 0..<inputsize:
 for x in 0..<linesize:
  let num = input[y][x]
  var nbs: seq[int]
  if y > 0: nbs.add(input[y-1][x])
  if y < inputsize-1: nbs.add(input[y+1][x])
  if x > 0: nbs.add(input[y][x-1])
  if x < linesize-1: nbs.add(input[y][x+1])
  nbs = nbs.sorted(system.cmp[int])
  if num < nbs[0]:
   res += num + 1
   
echo res
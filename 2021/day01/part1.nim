import std/strutils
import std/sequtils

const
 input = readFile("input.txt").splitLines().filterIt(it != "").mapIt(parseInt(it))
 size = len(input)

var res = 0
for i in 1..<size:
 if input[i] > input[i - 1]:
  res += 1

echo res
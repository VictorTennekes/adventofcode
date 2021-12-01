import std/strutils
import std/sequtils

const
 input = readFile("input.txt").splitLines().filterIt(it != "").mapIt(parseInt(it))
 size = len(input)

var
 values = newSeq[int](0)
 res = 0

for i in 0..<size-2:
 values.add(input[i] + input[i+1] + input[i+2])
for i in 1..<len(values):
 if values[i] > values[i-1]:
  res += 1
echo res
import std/[strutils, sequtils, math, sugar]

const input = readFile("input.txt").strip.splitLines.map(parseInt)
echo "part 1: ", sum(collect(for i in 1..input.high: (if input[i] > input[i-1]: 1)))
echo "part 2: ", sum(collect(for i in 0..input.high-3: (if sum(input[i..i+2]) < sum(input[i+1..i+3]): 1)))
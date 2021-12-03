include prelude

let
 input = readFile("input.txt").strip.splitLines
 size = input.len
 linesize = input[0].len

var count = newSeq[int](linesize)
for i in input:
 for j in 0..<linesize:
  if i[j] == '0':
   count[j] += 1;

var gamma, epsilon = ""

for i in 0..<linesize:
 if count[i] > size - count[i]:
  gamma.add('0')
  epsilon.add('1')
 else:
  gamma.add('1')
  epsilon.add('0')

echo parseBinInt(gamma) * parseBinInt(epsilon)
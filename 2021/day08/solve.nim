include prelude

let
 input = readFile("input.txt").strip.split("\n")
 size = input.len

func strdiff(s1: string, s2: string): string =
 result = " "
 for i in s1:
  if i notin s2:
   result = $i

func getValue(code: string, topr, botr, mid: string): string =
 result = case code.len:
  of 2: "1"
  of 3: "7"
  of 4: "4"
  of 5:
   if topr in code and botr in code: "3"
   elif topr in code: "2"
   else: "5"
  of 6:
   if mid notin code: "0"
   elif topr in code: "9"
   else: "6"
  of 7: "8"
  else: "0"

func part1(input: seq[string]): int =
 for line in input:
  result.inc(line.split("|")[1].split(" ").filterIt(it.len in [2,3,4,7]).len)

func part2(input: seq[string]): int =
 var codes: seq[string]
 let codeChars = "abcdefg"

 for i in input:
  codes = i.split(" ").filterIt(it != "|")
  let one = codes.filterIt(it.len == 2)[0]
  var botr, topr, topl, mid: string
  for i in codes[0..9]:
   if i.len == 6 and strdiff(one, i) != " ": topr = strdiff(codeChars, i)
  botr = strdiff(one, topr)
  for i in codes[0..9]:
   if i.len == 5 and getValue(i, topr, botr,"") == "2":
    topl = strdiff(codeChars, i & one)
  for i in codes[0..9]:
   if i.len == 4:
    mid = strdiff(i, botr & topr & topl)
  result.inc(parseInt(codes[10..codes.high].mapIt(getValue(it, topr, botr, mid)).join))

echo part1(input)
echo part2(input)

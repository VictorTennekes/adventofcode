include prelude

let
 input = readFile("input.txt").strip.split("\n")
 codeChars = "abcdefg"

func strdiff(one: string, two: string): char =
 result = ' '
 for i in one:
  if i notin two:
   result = i

func getValue(code: string, topr: char, botr: char, mid: char): string =
 case code.len:
  of 2: result = "1"
  of 3: result = "7"
  of 4: result = "4"
  of 5:
   if topr in code and botr in code: result = "3"
   elif topr in code: result = "2"
   else: result = "5"
  of 6:
   if mid notin code: result = "0"
   elif topr in code: result = "9"
   elif botr in code: result = "6"
  of 7: result = "8"
  else: result = "0"

var codes: seq[string]
var res = 0

for i in input:
 codes = i.split(" ").filterIt(it != "|")
 let one = codes.filterIt(it.len == 2)[0]
 var botr, topr, topl, mid: char
 for i in codes[0..9]:
  if i.len == 6 and strdiff(one, i) != ' ': topr = strdiff(codeChars, i)
 botr = strdiff(one, $topr)
 for i in codes[0..9]:
  if i.len == 5 and getValue(i, topr, botr, ' ') == "2":
   topl = strdiff(codeChars, i & one)
 for i in codes[0..9]:
  if i.len == 4:
   mid = strdiff(i, $botr & $topr & $topl)
 res.inc(parseInt(codes[10..codes.high].mapIt(getValue(it, topr, botr, mid)).join))
echo res
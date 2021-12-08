include prelude

let
 input = readFile("test.txt").strip.split("\n")
 size = input.len
 codeChars = "abcdefg"

func getValue(code: string): string =
 case code.len:
  of 2: result = "1"
  of 3: result = "7"
  of 4: result = "4"
  of 7: result = "8"
  else:
   return (code)

func getdecodedValue(code: string, top: char, bot: char): string =
 result = code
 if code.len == 5:
  if top in code and bot in code:
   result = "3"
  elif top in code:
   result = "5"
  else:
   result = "2"
 elif code.len == 6:
  if top in code and bot in code:
   result = "9"
  else:
   result = "6"

var res = 0

var codes: seq[string]
for line in input:
 var one: string
 var topr, botr, topl, botl: char
 codes = line.split(" ").filterIt(it != "|")
 for i in 10..codes.high:
  codes[i] = getValue(codes[i])
 for i in codes:
  if i.len == 2:
   one = i
 

 for i in 10..codes.high:
  codes[i] = getdecodedValue(codes[i], topr, botr)
 echo codes
 var local = codes[10..codes.high].join
 res.inc(parseInt(local))
echo res
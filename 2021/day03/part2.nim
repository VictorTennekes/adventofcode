include prelude

let
 input = readFile("input.txt").strip.splitLines

func commonBit(list: seq[string], index: int): char =
 var count = 0
 result = '0'
 for i in list:
  if i[index] == '1':
   inc count
 if count >= len(list) - count:
  result = '1'


proc commonOption(initList: seq[string]): string =
 var list = initList
 var ix = 0
 while list.len > 1:
  list = list.filterIt(it[ix] == commonBit(list, ix))
  inc ix
 list[0]

proc uncommonOption(initList: seq[string]): string =
 var list = initList
 var ix = 0
 while list.len > 1:
  list = list.filterIt(it[ix] != commonBit(list, ix))
  inc ix
 list[0]

echo parseBinInt(commonOption(input)) * parseBinInt(uncommonOption(input))
include prelude

let input = readFile("input.txt").strip.splitLines

func commonBit(list: seq[string], index: int): char =
 var count = 0
 result = '0'
 for i in list:
  if i[index] == '1':
   inc count
 if count >= len(list) - count:
  result = '1'

func getSelection(initList: seq[string], common: bool): string =
 var list = initList
 var ix = 0
 while list.len > 1:
  if common:
   list = list.filterIt(it[ix] == commonBit(list, ix))
  else:
   list = list.filterIt(it[ix] != commonBit(list, ix))
  inc ix
 list[0]

func part1(list: seq[string]): int =
 var gamma, epsilon = ""
 for ix in 0..<list[0].len:
  let bit = commonBit(list, ix)
  gamma.add(bit)
  epsilon.add(if bit == '1': '0' else: '1')
 result = parseBinInt(gamma) * parseBinInt(epsilon)

func part2(list: seq[string]): int =
 let oxygen = parseBinInt(getSelection(list, true))
 let co2 = parseBinInt(getSelection(list, false))
 result = oxygen * co2

echo "part 1: ", part1(input)
echo "part 2: ", part2(input)
include ../aoc

var data = readFile("input.txt").mapIt(parseHexInt($it).toBin(4)).join

type
 Packet = object
  version: int
  typeId: int
  value: int
  subPacks: seq[Packet]

proc takeStr(bits: var string, len: int): string =
 result = bits[0..<len]
 bits.delete(0..<len)

proc takeNum(bits: var string, len: int): int =
 result = parseBinInt(takeStr(bits, len))

proc parsePacket(bits: var string): Packet =
 result.version = bits.takeNum(3)
 result.typeId = bits.takeNum(3)
 if result.typeId == 4:
  var value = ""
  while true:
   let bit = bits.takeStr(5)
   value &= bit[1..^1]
   if bit[0] == '0':
    break
  result.value = value.parseBinInt
 else:
  let lenType = bits.takeNum(1)
  if lenType == 0:
   let bitLength = bits.takeNum(15)
   let targetLen = bits.len - bitLength
   while bits.len > targetLen:
    result.subPacks.add bits.parsePacket
  else:
   let packetCount = bits.takeNum(11)
   while result.subPacks.len < packetCount:
    result.subPacks.add bits.parsePacket

var p1 = 0
proc eval(packet: Packet): int =
 p1.inc packet.version
 let subPacks = packet.subPacks.map(eval)
 result = case packet.typeId:
  of 0: subPacks.sum
  of 1: subPacks.prod
  of 2: subPacks.min
  of 3: subPacks.max
  of 4: packet.value
  of 5: int(subPacks[0] > subPacks[1])
  of 6: int(subPacks[0] < subPacks[1])
  else:
   int(subPacks[0] == subPacks[1])

let parentPack = data.parsePacket
let p2 = eval(parentPack)
echo "part 2: ", p1
echo "part 1: ", p2
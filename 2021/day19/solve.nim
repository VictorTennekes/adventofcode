include ../aoc

type
 Point3 = tuple
  x: int
  y: int
  z: int

template `+`*(a,b:Point3):Point3 = (a.x+b.x, a.y+b.y, a.z+b.z)
template `-`*(a,b:Point3):Point3 = (a.x-b.x, a.y-b.y, a.z-b.z)
template `-`*(a:Point3):Point3 = (-a.x, -a.y, -a.z)

func rotations(p: Point3, perm: int): Point3 =
 case perm:
  of 1: return (p.x, -p.y, -p.z)
  of 2: return (-p.x, p.y, -p.z)
  of 3: return (-p.x, -p.y, p.z)
  of 4: return (p.x, p.z, -p.y)
  of 5: return (p.x, -p.z, p.y)
  of 6: return (-p.x, p.z, p.y)
  of 7: return (-p.x, -p.z, -p.y)

  of 8: return (p.y, p.z, p.x)
  of 9: return (p.y, -p.z, -p.x)
  of 10: return (-p.y, p.z, -p.x)
  of 11: return (-p.y, -p.z, p.x)
  of 12: return (p.y, p.x, -p.z)
  of 13: return (p.y, -p.x, p.z)
  of 14: return (-p.y, p.x, p.z)
  of 15: return (-p.y, -p.x, -p.z)

  of 16: return (p.z, p.x, p.y)
  of 17: return (p.z, -p.x, -p.y)
  of 18: return (-p.z, p.x, -p.y)
  of 19: return (-p.z, -p.x, p.y)
  of 20: return (p.z, p.y, -p.x)
  of 21: return (p.z, -p.y, p.x)
  of 22: return (-p.z, p.y, p.x)
  of 23: return (-p.z, -p.y, -p.x)
  else: return (p.x, p.y, p.z)

func permuteScanner(scanner: seq[Point3], index: int): seq[Point3] =
 for beacon in scanner:
  let rs = beacon.rotations(index)
  result.add rs

let input = readFile("input.txt").strip.split("\n\n")
var scanners: seq[seq[(Point3)]]
for part in input:
 var scanner: seq[Point3]
 for beacon in part.split("\n")[1..^1]:
  let (_, x, y, z) = scanTuple(beacon, "$i,$i,$i")
  scanner.add (x, y, z)
 scanners.add scanner

func checkOverlap(a, b: seq[Point3]): (bool, Point3) =
 var distances: CountTable[Point3]
 for ba in a:
  for bb in b:
   distances.inc(ba-bb, 1)
 let great = distances.largest
 if great.val >= 12:
  return (true, great.key)
 return (false, (0,0,0))

var normalScanners: HashSet[Point3]
let anchor = scanners[0]
scanners.delete(0)
normalScanners.incl anchor.toHashSet
while scanners.len > 0:
 var tmpScanners = scanners
 for index, scanner in tmpScanners:
  for i in 0..23:
   var rs = permuteScanner(scanner, i)
   let (valid, translation) = checkOverlap(normalScanners.toSeq, rs)
   if (valid):
    rs = rs.map(a => a + translation)
    normalScanners.incl rs.toHashSet
    scanners.delete(index)
    break

echo normalScanners.len
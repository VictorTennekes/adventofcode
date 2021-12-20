include ../aoc

type
 Point3 = tuple
  x, y, z: int

template `$`*(a:Point3):string = ($a.x & "," & $a.y & "," & $a.z)
template `+`*(a,b:Point3):Point3 = (a.x+b.x, a.y+b.y, a.z+b.z)
template `-`*(a,b:Point3):Point3 = (a.x-b.x, a.y-b.y, a.z-b.z)
template `-`*(a:Point3):Point3 = (-a.x, -a.y, -a.z)

proc rotations(p: Point3, n: int): Point3 =
 let (x, y, z) = (p.x, p.y, p.z)
 let trs = [(x, z, -y), (-z, x, -y), (-x, -z, -y),
            (z, -x, -y), (z, -y, x), (y, z, x),
            (-z, y, x), (-y, -z, x), (-y, x, z),
            (-x, -y, z), (y, -x, z), (x, y, z),
            (-z, -x, y), (x, -z, y), (z, x, y),
            (-x, z, y), (-x, y, -z), (-y, -x, -z),
            (x, -y, -z), (y, x, -z), (y, -z, -x),
            (z, y, -x), (-y, z, -x), (-z, -y, -x)]
 return trs[n]

func permuteScanner(scanner: seq[Point3], index: int): seq[Point3] =
 for beacon in scanner:
  let rs = beacon.rotations(index)
  result.add rs

let input = readFile("input.txt").split("\n\n")
var scanners: seq[seq[(Point3)]]
for part in input:
 var scanner: seq[Point3]
 for beacon in part.split("\n")[1..^1]:
  let (_, x, y, z) = scanTuple(beacon, "$i,$i,$i")
  scanner.add (x, y, z)
 scanners.add scanner

func checkOverlap(scan: seq[seq[Point3]], rs: seq[Point3], solved: HashSet[int]): (bool, Point3) =
 for index in solved:
  var distances: CountTable[Point3]
  for ba in scan[index]:
   for rb in rs:
    let tb = ba - rb
    distances.inc(tb, 1)
    if distances[tb] >= 12:
     return (true, tb)
 return (false, (0,0,0))

var solved = [0].toHashSet
var points: HashSet[Point3]
while solved.len < scanners.len:
 for index, scanner in scanners:
  if index in solved: continue
  for i in 0..23:
   var rs = permuteScanner(scanner, i)
   let (valid, translation) = checkOverlap(scanners, rs, solved)
   if valid:
     points.incl translation
     scanners[index] = rs.map(a => a + translation)
     solved.incl index
     break

echo scanners.foldl(a & b).toHashSet.len

var largest = 0
for i in points:
 for j in points:
  let d = i - j
  largest = largest.max(abs(d.x)+abs(d.y)+abs(d.z))
echo largest
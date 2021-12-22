include ../aoc

type Cuboid = object
 min: array[3, int]
 max: array[3, int]
 s: int

proc parse(line: string): Cuboid = 
 let (_, op, x0,x1,y0,y1,z0,z1) = line.scanTuple("$* x=$i..$i,y=$i..$i,z=$i..$i")
 result.s = 2*(op == "on").int - 1
 result.min = [x0,y0,z0]
 result.max = [x1+1,y1+1,z1+1]

let data = "input.txt".lines.toSeq.map(parse)

template apply(f: untyped, a1,a2: array[3, int]): array[3, int] = 
 [f(a1[0], a2[0]), f(a1[1], a2[1]), f(a1[2], a2[2])]
template volume(c: Cuboid): int = 
 max(c.max[0] - c.min[0], 0) * max(c.max[1] - c.min[1], 0) * max(c.max[2] - c.min[2], 0) * c.s

proc solve(data: seq[Cuboid]): int = 
 var cubes: seq[Cuboid]
 var new_cubes: Deque[Cuboid]
 for d in data:
  for c in cubes.items:
   let n = Cuboid(min: apply(max, d.min, c.min), max: apply(min, d.max, c.max), s: -c.s)
   if volume(n) != 0: new_cubes.addFirst n
  while new_cubes.len > 0: cubes.add new_cubes.popLast
  if d.s > 0: cubes.add d
 for c in cubes.items: result += volume(c)
func condition(x: Cuboid): bool =
 return x.min.all(it => it >= -50) and x.max.all(it => it <= 51)
let p1 = solve(data.filter(condition))
let p2 = p1 + solve(data.filterIt(not it.condition))
echo "part 1: ", p1
echo "part 2: ", p2
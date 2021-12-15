include ../aoc
import heapqueue

let
 input = readFile("input.txt").strip.split("\n")
 grid = input.map(L => L.mapIt(parseInt $it))

type Path = seq[Point]

func manhattan(a: Point, b: Point): int =
 abs(b.y - a.y) + abs(b.x - a.x)

proc buildPath(cameFrom: Table[Point, Point], start, goal: Point): Path =
  result.add(goal)
  var current = goal
  while current != start:
    current = cameFrom[current]
    result.add(current)
  result.sort()

func getNeighbours(grid: Grid[int], p: Point): seq[Point] =
 for (dx,dy) in directions4:
  let X = p[0]+dx
  let Y = p[1]+dy
  if X < 0 or X >= grid.width or Y < 0 or Y >= grid.height:
   continue
  result.add (X, Y)

proc aStar(grid: Grid[int], start: Point, goal: Point): (Path, int) =
 var
  frontier = initHeapQueue[(int, Point)]()
  previous: Table[Point, Point]
  costTotal: Table[Point, int]

 frontier.push (0, start)
 costTotal[start] = 0

 while frontier.len > 0:
  let (_, current)= frontier.pop

  if current == goal:
   return (previous.buildPath(start, goal), costTotal[goal])

  for next in grid.getNeighbours(current):
   let newCost = costTotal[current] + grid[next.y][next.x]
   if next notin costTotal or newCost < costTotal[next]:
    costTotal[next] = newCost
    let prio = newCost + next.manhattan(goal)
    frontier.push((prio, next))
    previous[next] = current

proc part1(data: Grid[int]): int =
 var path: Path
 (path, result) = data.aStar((0,0), (data.height-1, data.width-1))

proc part2(data: Grid[int]): int =
 var path: Path
 var grid2: seq[seq[int]]
 for i in 0..4:
  for r in grid:
   grid2.add r.mapIt((it + i + 8)mod 9 + 1)&r.mapIt((it + i + 0)mod 9 + 1)&r.mapIt((it + i + 1)mod 9 + 1)&r.mapIt((it + i + 2)mod 9 + 1)&r.mapIt((it + i + 3)mod 9 + 1)
 (path, result) = grid2.aStar((0,0), (grid2.height-1, grid2.width-1))

echo part1(grid)
echo part2(grid)
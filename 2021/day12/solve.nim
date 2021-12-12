include ../aoc

let input = readFile("input.txt").strip.split("\n")

func getOptions(input: seq[string]): Table[string, HashSet[string]] =
 for line in input:
  let (ok, cave1, cave2) = scanTuple(line, "$*-$*")
  if ok:
   if not result.hasKey(cave1):
    result[cave1] = initHashSet[string]()
   if not result.hasKey(cave2):
    result[cave2] = initHashSet[string]()
   result[cave1].incl(cave2)
   result[cave2].incl(cave1)

let options = getOptions(input)

proc Search(curr: string, visited: HashSet[string], dup: string): int =
 var localVisited = visited
 var dup = dup
 if curr == "end":
  return 1
 if dup != "off":
  if curr == "start" and visited.len > 0:
   return 0
 if curr.all(isLowerAscii) and curr in visited:
  if dup == "on":
   dup = curr
  else:
   return(0)
 localVisited.incl curr
 for next in options[curr]:
  result += Search(next, localVisited, dup)

let visited = initHashSet[string]()
echo Search("start", visited, "off")
echo Search("start", visited, "on")
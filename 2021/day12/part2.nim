include ../aoc

var
 input = readFile("input.txt").strip.split("\n")
 options: Table[string, HashSet[string]]

proc Search(curr: string, visited: HashSet[string], dup: bool): int =
 var visited = visited
 var dup = dup
 if curr == "end":
  return 1
 if curr == "start" and visited.len > 0:
  return 0
 if curr.all(isLowerAscii) and curr in visited:
   if dup == false:
    dup = true
   else:
    return 0
 visited.incl curr
 for next in options[curr]:
  result += Search(next, visited, dup)

for line in input:
 let (ok, cave1, cave2) = scanTuple(line, "$*-$*")
 if ok:
  if not options.hasKey(cave1):
   options[cave1] = initHashSet[string]()
  if not options.hasKey(cave2):
   options[cave2] = initHashSet[string]()
  options[cave1].incl(cave2)
  options[cave2].incl(cave1)

echo Search("start", initHashSet[string](), false)
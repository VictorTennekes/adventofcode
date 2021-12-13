include ../aoc

let input = readFile("input.txt").strip.split("\n")

func getOptions(input: seq[string]): Table[string, seq[string]] =
 for line in input:
  let (_,x,y) = scanTuple(line, "$*-$*")
  result.mgetOrPut(x, @[]).add(y)
  result.mgetOrPut(y, @[]).add(x)

let options = getOptions(input)

proc genPaths(paths: var int, visited: seq[string], dup:int) =
 if visited[^1] == "end":
  inc paths
 else:
  for cave in options[visited[^1]]:
   if cave[0].isUpperAscii or cave notin visited:
    genPaths(paths, visited & cave, dup)
   elif dup > 0 and cave != "start":
    genPaths(paths, visited & cave, dup - 1)
    
proc getPaths(dup=0): int =
 genPaths(result, @["start"], dup)

echo getPaths()
echo getPaths(1)
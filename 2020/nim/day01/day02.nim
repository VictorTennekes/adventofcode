import strutils

type
  Solutions*[T, V] = object
    first*: T
    second*: V
  IntSolutions* = Solutions[int, int]

func `$`*[T, V](x: Solutions[T, V]): string =
  result = &"{x.first}\n{x.second}"

proc parseIntSeq*(path: string): seq[int] =
    for line in path.lines:
        result.add parseInt(line)

func products(s: seq[int]): IntSolutions =
    for i in 0 ..< s.len:
        for j in i+1 ..< s.len:
            if s[i] + s[j] == 2020:
                result.first = s[i] * s[j]
            elif s[i] + s[j] < 2020:
                for k in j+1 ..< s.len:
                    if s[i] + s[j] + s[k] == 2020:
                        result.second = s[i] * s[j] * s[k]

let input = parseIntSeq("input.txt")
echo products(input)
include ../aoc

let input = readFile("input.txt").strip.split("\n")

type
 Node = object
  nest: int
  unnest: int
  val: int

type Num = seq[Node]
type Nums = seq[Num]

proc ParseNum(line: string): Num =
 var nest = 0
 var unnest = 0
 for c in line:
  if c == '[': inc nest
  elif c == ']': inc unnest
  elif c != ',':
   result.add(Node(nest:nest, unnest: unnest, val: c.ord - '0'.ord))
   nest = 0
   unnest  = 0

proc reduce(num: var Num): void =
 var changed = true
 while changed:
  changed = false

  var nest = 0
  var i = 0
  while i < num.len:
   let n = num[i]
   let nest2 = nest + n.nest - n.unnest
   if nest2 > 4 and num[i + 1].nest == 0:
    if i > 0:
     num[i - 1].val += n.val
    if i + 2 < num.len:
     num[i + 2].val += num[i + 1].val
     dec num[i + 2].unnest
     assert num[i + 2].unnest >= 0

    num[i].val = 0
    dec num[i].nest
    assert num[i].nest >= 0

    num.delete(i+1)
    changed = true
   else:
    nest = nest2
    inc i

  for i in 0..<num.len:
   let val = num[i].val
   if val >= 10:
    num[i].val = val div 2
    inc num[i].nest
    num.insert(Node(val: (val / 2).ceil.int), i+1)
    if i + 2 < num.len:
     inc num[i + 2].unnest
    changed = true
    break

proc magnitude(num: Num): int =
 var d = ""
 for i, n in num:
  if n.unnest > 0:
   d[^n.unnest..^1] = ""
  if d.endsWith('l'):
   d[^1] = 'r'
  if n.nest > 0:
   d &= 'l'.repeat(n.nest)

  let l = d.count('l')
  let r = d.count('r')
  result += 3^l * 2^r * n.val

proc nestEnd(num: Num): int =
 num.foldl(a + b.nest - b.unnest, 0)

proc `+`(x, y: Num): Num =
 result = x & y
 inc result[0].nest
 result[x.len].unnest = x.nestEnd
 result.reduce

proc sum(nums: Nums): Num =
 nums[1..^1].foldl(a + b)

func part1(nums: Nums): int =
 nums.sum.magnitude

proc part2(nums: Nums): int =
 for i in 0..<nums.len:
  for j in i+1..<nums.len:
   result = [result, magnitude(nums[i] + nums[j]), magnitude(nums[j] + nums[i])].max

let nums = input.map(ParseNum)
echo "Part 1: ", nums.part1
echo "Part 2: ", nums.part2
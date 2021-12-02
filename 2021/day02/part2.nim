include prelude

let
 input = readFile("input.txt").strip.splitLines

var
 x = 0
 y = 0
 aim = 0

for i in input:
 let
  line = i.split()
  direction = line[0]
  value = parseInt(line[1])
 if direction == "forward":
  x += value
  y += aim * value
 elif direction == "down":
  aim += value
 elif direction == "up":
  aim -= value
echo x * y
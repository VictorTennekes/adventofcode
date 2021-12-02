include prelude

let
 input = readFile("input.txt").strip.splitLines
 size = input.len

var
 x = 0
 y = 0

for i in input:
 let value = i.split()
 if value[0] == "forward":
  x += parseInt(value[1])
 elif value[0] == "down":
  y += parseInt(value[1])
 elif value[0] == "up":
  y -= parseInt(value[1])
echo x * y
include ../aoc

let input = readFile("input.txt").split("\n")

proc solve(p2=false): int =
 var data: HashSet[array[7, int]]
 for switch in input:
  var (_, op, x0, x1, y0, y1, z0, z1) = scanTuple(switch, "$w x=$i..$i,y=$i..$i,z=$i..$i")
  if not p2 and (x0 < -50 or x1 > 50 or y0 < -50 or y1 > 50 or z0 < -50 or z1 > 50):
   continue
  x1 += 1
  y1 += 1
  z1 += 1
  var cube = [x0, x1, y0, y1, z0, z1, (op == "on").int]
  var new_items: HashSet[array[7, int]]
  for i in data:
   var item = i
   if x1 > item[0] and x0 < item[1] and y1 > item[2] and y0 < item[3] and z1 > item[4] and z0 < item[5]:
    if item[0] < x0:
     var new_item = [item[0],x0,item[2],item[3],item[4],item[5],item[6]]
     item[0] = x0
     new_items.incl new_item
    if item[1] > x1:
     var new_item = [x1,item[1],item[2],item[3],item[4],item[5],item[6]]
     item[1] = x1
     new_items.incl new_item
    if item[2] < y0:
     var new_item = [item[0],item[1],item[2],y0,item[4],item[5],item[6]]
     item[2] = y0
     new_items.incl new_item        
    if item[3] > y1:
     var new_item = [item[0],item[1],y1,item[3],item[4],item[5],item[6]]
     item[3] = y1
     new_items.incl new_item 
    if item[4] < z0:
     var new_item = [item[0],item[1],item[2],item[3],item[4],z0,item[6]]
     item[4] = z0
     new_items.incl new_item        
    if item[5] > z1:
     var new_item = [item[0],item[1],item[2],item[3],z1,item[5],item[6]]
     item[5] = z1
     new_items.incl new_item
   else:
    new_items.incl item
  new_items.incl cube
  data = new_items

 for item in data:
   if item[6]==1:
     result += (item[1]-item[0])*(item[3]-item[2])*(item[5]-item[4])

echo "part 1: ", solve()
echo "part 2: ", solve(true)
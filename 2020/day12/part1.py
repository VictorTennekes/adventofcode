directions = open("input.txt", "r").read().split("\n")
x, y = 0, 0
options = ['N', 'E', 'S', 'W']
orientation = 1
for i in directions:
	tmp = ""
	if i[0] == 'F':
		tmp += options[orientation]
		tmp += i[1:]
	elif i[0] == 'R':
		orientation = int((orientation + (int(i[1:]) % 360) / 90)) % 4
		continue
	elif i[0] == 'L':
		orientation = int((orientation - (int(i[1:]) % 360) / 90)) % 4
		continue
	else:
		tmp += i
	if tmp[0] == 'N':
		y += int(i[1:])
	elif tmp[0] == 'S':
		y -= int(i[1:])
	elif tmp[0] == 'E':
		x += int(i[1:])
	elif tmp[0] == 'W':
		x -= int(i[1:])
print(abs(x) + abs(y))
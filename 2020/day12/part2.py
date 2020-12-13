directions = open("input.txt", "r").read().split("\n")
options = ['N', 'E', 'S', 'W']
orientation = 1
shipX, shipY = 0, 0
wayX, wayY = 10, 1
for i in directions:
	if i[0] == 'F':
		shipX += wayX * int(i[1:])
		shipY += wayY * int(i[1:])
	elif i[0] == 'R':
		rotation = int((int(i[1:]) % 360) / 90)
		if rotation == 1:
			tmp = wayY
			wayY = wayX * -1
			wayX = tmp
		elif rotation == 2:
			wayX *= -1
			wayY *= -1
		elif rotation == 3:
			tmp = wayX
			wayX = wayY * -1
			wayY = tmp
	elif i[0] == 'L':
		rotation = int((int(i[1:]) % 360) / 90)
		if rotation == 1:
			tmp = wayY
			wayY = wayX
			wayX = tmp * -1
		elif rotation == 2:
			wayX *= -1
			wayY *= -1
		elif rotation == 3:
			tmp = wayY
			wayY = wayX * -1
			wayX = tmp
	elif i[0] == 'N':
		wayY += int(i[1:])
	elif i[0] == 'S':
		wayY -= int(i[1:])
	elif i[0] == 'E':
		wayX += int(i[1:])
	elif i[0] == 'W':
		wayX -= int(i[1:])
print(abs(shipX)+ abs(shipY))
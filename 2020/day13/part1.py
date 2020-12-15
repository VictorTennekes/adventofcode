data = open("input.txt", "r").read().split("\n")
leaveTime = int(data[0])
busses = sorted([int(i) for i in data[1].split(",") if i != 'x'])
tmp = leaveTime
while 1:
	for i in busses:
		if tmp % i == 0:
			print((tmp - leaveTime) * i)
			quit()
	tmp += 1
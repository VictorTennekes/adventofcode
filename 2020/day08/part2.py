def checkForLoop(instructions):
	i = 0
	acc = 0
	visited = [False] * len(instructions)
	while i < len(instructions):
		if visited[i] == True:
			return ([False, acc])
		visited[i] = True
		call = instructions[i]
		if call[0:3] == "nop":
			i += 1
			continue
		elif call[0:3] == "acc":
			acc += int(call[4:])
			i += 1
		elif call[:3] == "jmp":
			num = int(call[4:])
			i += int(call[4:])
	return ([True, acc])

instructions = open("input.txt", "r").read().split("\n")
res = checkForLoop(instructions)
if res[0] == True:
	print(res[1])
	quit()
for i in range(len(instructions) - 1, 0, -1):
	tmp = []
	tmp += instructions
	if instructions[i][:3] == "jmp":
		tmp[i] = tmp[i].replace("jmp", "nop")
	elif instructions[i][:3] == "nop":
		tmp[i] = tmp[i].replace("nop", "jmp")
	else:
		continue
	res = checkForLoop(tmp)
	if res[0] == True:
		print(res[1])
		quit()
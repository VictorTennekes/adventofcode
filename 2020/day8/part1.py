instructions = open("input.txt", "r").read().split("\n")

visited = [False] * len(instructions)
acc = 0
i = 0
while i < len(instructions):
	if visited[i] == True:
		break
	visited[i] = True
	call = instructions[i]
	print(call)
	if call[0:3] == "nop":
		i += 1
		continue
	elif call[0:3] == "acc":
		acc += int(call[4:])
	elif call[0:3] == "jmp":
		i += int(call[4:]) - 1
	i += 1
print(acc)
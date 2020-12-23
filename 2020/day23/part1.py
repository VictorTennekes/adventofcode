nums = [int(i) for i in "653427918"]
dataSize = len(nums)

index = 0

def printMove(nums, pick, index, i, dest):
	print("-- move", i, "--")
	print("index:", index)
	print("cups", *(i for i in nums))
	print("pick up:", *(i for i in pick))
	print("destination:", dest)
	print("")

for i in range(100):
	numCpy = nums.copy()
	curr = nums[index]
	c1, c2, c3 = nums[(index + 1) % dataSize], nums[(index + 2) % dataSize], nums[(index + 3) % dataSize]
	nums.remove(c1)
	nums.remove(c2)
	nums.remove(c3)
	search = curr - 1
	while search not in nums:
		search = search - 1 if search > 1 else 9
	foundIndex = nums.index(search)
	nums.insert(foundIndex + 1 % dataSize, c1)
	nums.insert(foundIndex + 2 % dataSize, c2)
	nums.insert(foundIndex + 3 % dataSize, c3)
	# if i < 10:
	# 	printMove(numCpy, [c1,c2,c3], index, i + 1, search)
	if index > foundIndex:
		index += 3
	index = index + 1 if index < 8 else 0
oneDex = nums.index(1)
print(*(i for i in nums[oneDex + 1:]), *(i for i in nums[:oneDex]), sep='')
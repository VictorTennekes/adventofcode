nums = [int(i) for i in open("input.txt", "r").read().split("\n")]
target = 217430975
for i in range(0, len(nums)):
	curr = 0
	j = i + 2
	while curr < target:
		if j > len(nums):
			break
		arr = nums[i:j]
		curr = sum(q for q in arr)
		j += 1
	if (curr == target):
		print(min(arr) + max(arr))
		quit()
nums = [int(i) for i in open("input.txt", "r").read().split("\n")]
for i in range(25, len(nums)):
	arr = nums[i - 25:i]
	if sum(1 for j in arr if nums[i] - j in arr) < 1:
		print(nums[i])
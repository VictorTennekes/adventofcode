noun = 0
verb = 0

def array_calc(noun,verb)
	array = Array.new([1,noun,verb,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,9,19,1,5,19,23,1,6,23,27,1,27,10,31,1,31,5,35,2,10,35,39,1,9,39,43,1,43,5,47,1,47,6,51,2,51,6,55,1,13,55,59,2,6,59,63,1,63,5,67,2,10,67,71,1,9,71,75,1,75,13,79,1,10,79,83,2,83,13,87,1,87,6,91,1,5,91,95,2,95,9,99,1,5,99,103,1,103,6,107,2,107,13,111,1,111,10,115,2,10,115,119,1,9,119,123,1,123,9,127,1,13,127,131,2,10,131,135,1,135,5,139,1,2,139,143,1,143,5,0,99,2,0,14,0])

	i = 0
	while i < array.length
		if array[i] == 1 || array[i] == 2
			sign = array[i]
			num1 = array[array[i + 1]]
			num2 = array[array[i + 2]]
			index = array[i + 3]
			if sign == 1
				array[index] = num1 + num2
			end
			i += 3
			if sign == 2
				array[index] = num1 * num2
			end
		end
		if array[i] == 99
			break
		end
		i += 1
	end
	if array[0] == 19690720
		puts noun
		puts verb
		puts 100 * noun + verb
	end
end

while noun < 100
	verb = 0
	while verb < 100
		array_calc(noun, verb)
		verb += 1
	end
	noun += 1
end

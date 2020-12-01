require 'set'

file_path	= File.expand_path("../input.txt", __FILE__)
input		= File.read(file_path)

def move(path)
	visited = Set.new
	x,y = 0,0

	path.split(",").each do |instr|
		dir = instr[0]
		steps = instr[1..4].to_i

		steps.times do
			case dir
			when "U"
			  y += 1
			when "D"
			  y -= 1
			when "L"
			  x -= 1
			when "R"
			  x += 1
			end
			visited.add [x, y]
		end
	end
	visited
end

path_one, path_two = input.split("\n")

intersect = move(path_one) & move(path_two)

puts intersect.map{|x, y| x.abs + y.abs}.min

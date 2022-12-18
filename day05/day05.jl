#find startswith line

function day05(path::String)
	#stacks, num_moves,origins,goals = parse_input1(path)
	stacks,instructions = parse_input(path)
	stacks2 = deepcopy(stacks)
	return part1(stacks, instructions), part2(stacks2, instructions)
end


function parse_input(path::String)
	lines = readlines(path)

    idx_fin = 1
	for (idx,line) in enumerate(lines)
		if startswith(line, " 1")
			idx_fin = idx
			break
		end
	end

	num_stacks = parse(Int8, lines[idx_fin][end-1])
	stacks=Vector{Vector{Char}}()

	for _ in 1:num_stacks
		push!(stacks,Char[])
	end

	cur_stack = 1
	for offset in 2:4:lastindex(lines[idx_fin])
		push!(stacks[cur_stack], reverse([x for x in getindex.(lines[1:idx_fin-1],offset) if x!= ' '])... )
		cur_stack += 1
	end

	instructions = ((parse(Int8,match.match) for match in iter) for iter in eachmatch.(r"-?\d+", lines[idx_fin+2:end]))

	return stacks, instructions
end

function part1(stacks, instructions)
	for (n, o, g) in instructions
		push!(stacks[g], [pop!(stacks[o]) for _ in 1:n]...)

	end
	return [stack[end] for stack in stacks if length(stack) != 0]
end

function part2(stacks, instructions)
	for (n, o, g) in instructions
		push!(stacks[g], reverse([pop!(stacks[o]) for _ in 1:n])...)

	end
	return [stack[end] for stack in stacks if length(stack) != 0]
end


r = day05("day05/day05.txt")
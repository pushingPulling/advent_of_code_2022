function day01(path::String)
    input = read(path,String)
    input = split(input, "\r\n\r\n")
    input = [parse.(Int32,split(x,"\r\n")) for x in input]
    return part1(input), part2(input)
end



function part1(input)
    return maximum(sum.(input))
end

function part2(input)
    return sum(partialsort(sum.(input),1:3,rev=true))
end

r = day01("day01/day01.txt")
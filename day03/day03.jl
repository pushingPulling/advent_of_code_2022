using Pipe: @pipe

function day03(path::String)
    input = readlines(path)
    return part1(input), part2(input)

end

function part1(input)
    return @pipe find_duplicate.(input) |> .+(_,isuppercase.(_)*58) |> .-(_,'`') |> sum
end

function part2(input)
    return @pipe find_badge.([input[i:i+2] for i in 1:3:length(input)]) |> .+(_,isuppercase.(_)*58) |> .-(_,'`') |> sum
end

function find_duplicate(line)
    return intersect(line[1:div(length(line),2)], line[div(length(line),2)+1 : end])[1]
end

function find_badge(lines)
    return intersect(lines...)[1]
end



r = day03("day03/day03.txt")
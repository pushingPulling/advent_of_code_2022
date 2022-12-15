function day02(path::String)
    input = readlines(path)

    return part1(input), part2(input), [getindex.(input,3)]
end

function round_score(l::String)
    (l == "A X" || l == "B Y" || l == "C Z") && (return 3 + l[3] -'W' )
    (l == "A Y" || l == "B Z" || l == "C X") && (return 6 + l[3] -'W' )
    return l[3] -'W'
end

function fix_round(l::String)
    (l == "A X" || l == "B X"|| l == "C X") && return mod1(l[1] + 2 - '@',3)
    (l == "A Y" || l == "B Y"|| l == "C Y") && return mod1(l[1] + 0 - '@',3) +3
    (l == "A Z" || l == "B Z"|| l == "C Z") && return mod1(l[1] + 1 - '@',3) +6
end


function part1(input)
    return sum(map(round_score,input))
end

function part2(input)
    return sum(map(fix_round, input))
end

r = day02("day02/day02.txt")
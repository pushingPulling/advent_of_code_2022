function day04(path::String)
    lines= parse_input(path)
    return part1(lines) ,part2(lines)
end


function parse_input(path::String)
    lines = split.(readlines(path),",")
    lines = [[parse.(Int8,split(subline, "-")) for subline in x] for x in lines]
    return lines

end

function find_total_overlap(line)
    a,b = line[1][1], line[1][2]
    c,d = line[2][1], line[2][2]
    return (a>= c && b <= d || a <= c && b >= d)
end

function find_partial_overlap(line)
    a,b = line[1][1], line[1][2]
    c,d = line[2][1], line[2][2]
    return any((a in c:d, b in c:d, c in a:b, d in a:b))
end

function part1(lines)
    sum(find_total_overlap.(lines))
end

function part2(lines)
    sum(find_partial_overlap.(lines))
end

r = day04("day04/day04.txt")
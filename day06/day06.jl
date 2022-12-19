using BenchmarkTools
using StatProfilerHTML


function day06(path::String)
    nums = read(path)
    return part1(nums), part2(nums)
end

function find_n_distinct_sequence(nums::Vector{UInt8}, n::UInt8)
    l = nums[1:n]
    sort!(l)

    isnothing(findfirst(l_el-> l[l_el] == l[l_el+1], 1:n-1)) && (return n)

    for (idx,x) in enumerate(nums[n+1:end])
        deleteat!(l, findfirst(el -> el == nums[idx],l))
        id = findfirst(el-> el >= x,l)
        isnothing(id) ? push!(l,x) : insert!(l, id, x) 
        isnothing(findfirst(l_el-> l[l_el] == l[l_el+1], 1:n-1)) && (return idx+n)
    end
    return -1
end

part1(nums::Vector{UInt8}) = find_n_distinct_sequence(nums, UInt8(4))
part2(nums::Vector{UInt8}) = find_n_distinct_sequence(nums, UInt8(14))

day06("day06/day06.txt")
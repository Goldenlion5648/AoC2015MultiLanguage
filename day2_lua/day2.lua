file = io.open("input2.txt", "rb")
local content =file:read "*a"
local linesTable = {}
local total = 0
-- content.gsub("\n", )
for line in string.gmatch(content, "[^\n]+") do
    if string.len(line) > 2 then
        table.insert(linesTable, line)
    end
end
-- io.write(#(linesTable))
local total = 0
local part2Answer = 0

function findMin(t, blacklist)
    local minVal = 1000000000000000000
    local minPos = -1
    for i,v in ipairs(t) do
        -- print(i, "has val", v)
        if v < minVal and blacklist[i] == nil then
            minVal = v
            minPos = i
        end
    end
    blacklist[minPos] = true
    return minVal, blacklist
end

for k, v in pairs(linesTable) do
    curNums = {}
    local matches = string.gmatch(v, "[^{x}^{\n}]+")
    for i in (matches) do
        -- io.write(i)
        table.insert(curNums, tonumber(i))
    end
    -- print()
    local temp1, temp2, temp3
    temp1 = curNums[1] * curNums[2]
    temp2 = curNums[2] * curNums[3]
    temp3 = curNums[1] * curNums[3]
    total = total + math.min(temp1, temp2, temp3)

    total = total + temp3 * 2
    total = total + temp1 * 2
    total = total + temp2 * 2
    local tempTable = {temp1, temp2, temp3} 
    local min1, used = findMin(curNums, {})
    -- print("min1: "..min1)
    -- print("used")
    local min2, used = findMin(curNums, used)
    -- print("min2: "..min2)
    part2Answer = part2Answer + min1 * 2
    part2Answer = part2Answer + min2 * 2

    -- print("before"..part2Answer)
    local mult = 1
    for i, j in pairs(curNums) do
        mult = mult * j
    end
    part2Answer = part2Answer + mult 
end
io.write("\npart 1: "..total.."\n")
io.write("part 2: "..part2Answer.."\n")

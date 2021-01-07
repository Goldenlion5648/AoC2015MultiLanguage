instructs = File.open("input3.txt", 'r').read.split(//)

# print instructs
# puts
# visited[(pos_x, pos_y)] += 1
def useInstruct(letter, pos_x, pos_y)
    if letter == "^"
        pos_y -= 1
    elsif letter == "v"
        pos_y += 1
    elsif letter == "<"
        pos_x -= 1
    elsif letter == ">"
        pos_x += 1
    end
    return pos_x, pos_y
end
# puts visited
def part1(instructs)
    pos_x = 0
    pos_y = 0
    visited = Hash.new(0)
    visited[[pos_x, pos_y]] += 1
    instructs.each do |i|
        pos_x, pos_y = useInstruct(i, pos_x, pos_y)
        visited[[pos_x, pos_y]] += 1
    end
    puts "part 2: " + visited.size.to_s
end


def part2(instructs)
    x1, y1, x2, y2 = 0, 0, 0, 0
    visited = Hash.new(0)
    visited[[x1, y1]] += 1
    instructs.each_with_index do |char, j|
        if j % 2 == 0
            x1, y1 = useInstruct(char, x1, y1)
            visited[[x1, y1]] += 1
        else
            x2, y2 = useInstruct(char, x2, y2)
            visited[[x2, y2]] += 1
        end
    end
    # puts "#{x1} #{x2}"
    puts "part 2: " + visited.size.to_s
end

part1(instructs)
part2(instructs)
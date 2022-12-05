def read(filename, size)
    stacks = Array.new(size) {Array.new}
    moves  = []
    File.open(filename).each do |ln|
        next if ln =~ /^\s1/
        if ln =~ /^move/
            moves << ln.chomp 
            next
        end

        ln.chomp.chars.each_slice(4).with_index do |col, idx|
            next if col[1] == " "
            stacks[idx].unshift(col[1])
        end
    end
    return stacks,moves
end

def move(str)
    cmd,count,from,x,to,y = str.split(/\s/)
    return [cmd, count.to_i, x.to_i, y.to_i]
end



def part1(filename)
    stacks, moves = read(filename, 10)
    moves.each do |m|
        cmd,count,x,y = move(m)
        count.times do
            stacks[y-1] << stacks[x.-1].pop
        end
    end
    puts stacks.map{|m| m[-1]}.join
end

def part2(filename)
    stacks, moves = read(filename, 10)
    moves.each do |m|
        cmd,count,x,y = move(m)
        stacks[y-1].concat stacks[x-1].pop(count)
    end
    puts stacks.map{|m| m[-1]}.join
end

puts
puts "part1 input-sample.txt"
part1("input-sample.txt")

puts
puts "part1 input.txt"
part1("input.txt")

puts
puts "part2 input-sample.txt"
part2("input-sample.txt")

puts
puts "part2 input.txt"
part2("input.txt")

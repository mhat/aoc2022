

def marker(str, sz)
    chs = str.chars
    (0...(chs.size-sz)).each do |i|
        return i+sz if chs[i...i+sz].uniq.size == sz
    end
end

def part1(filename)
    File.open(filename).each do |ln|
        puts marker(ln.chomp, 4)
    end
end


def part2(filename)
    File.open(filename).each do |ln|
        puts marker(ln.chomp, 14)
    end
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

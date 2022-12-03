def part1(filename)
    to = 0
    File.open(filename).each do |line|
        line.chomp!
        lh = line[0..((line.size-1)/2)].chars
        rh = line[(((line.size-1)/2)+1)..-1].chars
        ch = lh.find { |c| rh.include?(c) }
        to += ch.ord >= 97 ? ch.ord - 96 : ch.ord - 64 + 26
    end
    puts "Total: #{to}"
end

# each three lines of the file is a group
# find a letter common to all three
# 
def part2(filename)
    tot = 0
    File.open(filename).each_slice(3) do |grp|
        g1, g2, g3 = grp.map(&:chomp).map(&:chars)
        ch = g1.find do |ch|
            g2.include?(ch) && g3.include?(ch)
        end
        tot += ch.ord >= 97 ? ch.ord - 96 : ch.ord - 64 + 26
    end
    puts "Total: #{tot}"
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

# each line is a pair 2-4,6-8
# each is a range 2..4, 6..8
# want to determine if one range is fully incldude in the other

def part1(filename)
    overlaps = 0
    File.open(filename).each do |ln|
        lh, rh = ln.chomp.split(',')
        lh_min, lh_max = lh.split('-').map(&:to_i)
        rh_min, rh_max = rh.split('-').map(&:to_i)
        if (lh_min >= rh_min && lh_max <= rh_max) || 
           (rh_min >= lh_min && rh_max <= lh_max)
            overlaps += 1
        end
    end
    puts "Overlaps: #{overlaps}"

end

# now rather than containment we want overlap
def part2(filename)
    overlaps = 0
    File.open(filename).each do |ln|
        lh, rh = ln.chomp.split(',')
        lh_min, lh_max = lh.split('-').map(&:to_i)
        rh_min, rh_max = rh.split('-').map(&:to_i)

        if rh_min < lh_min
            lh_min, rh_min = rh_min, lh_min
            lh_max, rh_max = rh_max, lh_max
        end

        if lh_max - rh_min >= 0
            overlaps += 1
            next
        end
    end
    puts "Overlaps: #{overlaps}"

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

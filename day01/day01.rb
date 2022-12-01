
def part1(filename)
    elves     = []
    elf_total = 0
    max_elf   = 0
    max_elf_total = 0
    File.open(filename).each do |line|
        if line == "\n"
            elves << elf_total
            if max_elf_total < elf_total
                max_elf_total = elf_total
                max_elf       = elves.size
            end
            elf_total = 0
        else
            elf_total += line.chomp.to_i
        end
    end

    elves << elf_total
    if max_elf_total < elf_total
        max_elf_total = elf_total
        max_elf       = elves.size
    end

    # elves.each_with_index do |total, elf|
    #     puts "#{elf+1} #{total}"
    # end

    puts "Elf # #{ max_elf } has #{ max_elf_total }"
end

def part2(filename)
    elves   = []
    elf_tot = 0
    elf_pos = 0

    File.open(filename).each do |line|
        if line == "\n"
            elves << [ elf_pos, elf_tot ]
            elf_tot = 0
            elf_pos = elves.size
        else
            elf_tot += line.chomp.to_i
        end
    end

    top3 = 0
    elves.sort_by{|e| e[1]}.last(3).each do |elf|
      puts "Elf # #{ elf[0] } has Calories #{ elf[1]}"
      top3 += elf[1]
    end

    puts "Top3: #{top3}"
end

puts
puts "part1 using input-sample.txt"
part1("input-sample.txt")

puts
puts "part2 using input-sample.txt"
part2("input-sample.txt")

puts
puts "part1 using input.txt"
part1("input.txt")

puts
puts "part2 using input.txt"
part2("input.txt")
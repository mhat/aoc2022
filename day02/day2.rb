RPS1 = {
    'A X' => 1+3,
    'A Y' => 2+6,
    'A Z' => 3+0,
    'B X' => 1+0,
    'B Y' => 2+3,
    'B Z' => 3+6,
    'C X' => 1+6,
    'C Y' => 2+0,
    'C Z' => 3+3,
}

def part1(filename)
    sc = 0
    File.open(filename).each do |line|
        sc += RPS1[line.chomp]
    end
    puts "Score: #{ sc }"
end

RPS2 = {
    'A X' => 3 + 0,
    'A Y' => 1 + 3,
    'A Z' => 2 + 6,
    'B X' => 1 + 0,
    'B Y' => 2 + 3,
    'B Z' => 3 + 6,
    'C X' => 2 + 0,
    'C Y' => 3 + 3,
    'C Z' => 1 + 6,
}

def part2(filename)
    sc = 0
    File.open(filename).each do |line|
        sc += RPS2[line.chomp]
    end
    puts "Score: #{ sc }"
end

puts
puts "day2 part1 imput-sample.txt"
part1("input-sample.txt")

puts
puts "day2 part1 imputtxt"
part1("input.txt")

puts
puts "day2 part2 imput-sample.txt"
part2("input-sample.txt")

puts
puts "day2 part2 imputtxt"
part2("input.txt")
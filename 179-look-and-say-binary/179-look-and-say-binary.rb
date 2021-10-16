input = "1110001111011001001000111011011100111010011001101101001110001110000101100011001010011101110001001110001100110001110001001110010100011001111"

def calculate_parents(str)

    # prety naive factorial
    def f(a)
        return 1 if a < 2
        return a * f(a-1)
    end

    # pretty naive combinations
    def c(a, b)
        f(a) / f(b) / f(a-b)
    end

    ones_count = str.count("1")
    total = 2
    (1..(ones_count-2)).each { |i| total += c(ones_count-1, i) }

    return total
end

def look_and_say(str)
    counts = []; count = 0; prev = "1"
    str.each_char do |ch|
        if ch == prev
            count += 1
        else
            counts << count
            count = 1
            prev = ch
        end
    end

    counts << count
    return counts.map { |e| e.to_s(2) }.join("")

end

number = input
counter = 0
while number != "10"
    number = look_and_say(number)
    counter += 1
    # puts "#{counter}] #{number}"
end

puts "#{counter} #{calculate_parents(input)}"

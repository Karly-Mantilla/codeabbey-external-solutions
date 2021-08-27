contents = File.read(ARGV[0])

puts "input data:\n#{contents}\nanswer:"

num_list = contents.split("\n")[1..-1].map {|x| x.split(' ').map {|y| y.to_i}}

for line in num_list

    num = line[0]
    passes = line[1]

    root = 1.0

    while passes > 0

        div = num / root
        root = ((root + div) / 2)

        passes -= 1

    end

    if (root + 1) % (root.to_i + 1) == 0
        print "#{root.to_i} "
    else
        print "#{root.round(7)} "
    end

end

puts "\n"
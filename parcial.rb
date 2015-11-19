square = "some shape"
sum = 0
[1, 2, 3, 4].each do |value, square, uno, dos=2|
    puts square.class
    puts "vaiable #{dos}"
    square = value * value # different variable
    puts square
    sum += square
end
puts sum
puts square

puts "con haaaaaaaaaaashhhh"
{a:1,b:2,c:'Tiragoma'}.each do |k, v,b,a,d|
   puts a.class
   puts "clave #{k}, valor #{v}"
end


puts "Arreglllloooo"



class Array
    def my_find
        for i in 0...size
            value = self[i]
            return value if yield(value)
        end
        return nil
    end
end

p (1..200).to_a.my_find {|x| x%5 == 0}
p (1..200).to_a.my_find {|x| x == 0}



puts "ENUMERADORES"



nombre = Enumerator.new do |caller|
    caller.yield "luciano"
    puts "a"
    puts "b"
    puts "c"
    caller.yield "lucas"
    puts "d"
    caller.yield "jorgito"
    puts "e"
end

#4.times { puts nombre.next }

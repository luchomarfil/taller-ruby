#Ejercicio numero 16
def suma(tope)
  (1..tope).select{|n| n % 3 == 0 || n % 5 == 0}.inject(0) do |sum,v|
      sum + v
  end
end

puts suma(5)

#Ejercicio numero 17
fibonacci = Enumerator.new do |caller|
    i1, i2 = 1, 1
    loop do
        caller.yield i1
        i1, i2 = i2, i1+i2
    end
end

class Enumerator
    def infinite_select(&block)
        Enumerator.new do |caller|
            self.each do |value|
                caller.yield(value) if block.call(value)
            end
        end
    end
end

a = fibonacci.infinite_select {|val| val % 2 == 0}
sum = 0
loop do
  val = a.next
  break if val > 4000000
  if (val<4000000)
    sum+=val
  end
end
puts "suma #{sum}"

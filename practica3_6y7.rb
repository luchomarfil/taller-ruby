
puts "EJERCICIO 6"

=begin
    cantidad = 0
    minimo = 1
    while cantidad < minimo
     puts "¿Cuál es la cantidad de números que ingresará? Debe ser al menos #{minimo}"
     begin
       cantidad = Kernel.gets
       raise if cantidad.match(/^\d+$/).nil?
       cantidad = cantidad.to_i
     rescue
        puts 'Debe ingresar un numero'
        cantidad = 0
     end
    end

    # Luego se almacenan los números
    numeros = 1.upto(cantidad).map do
     puts 'Ingrese un número'
     begin
       numero = Kernel.gets
       raise if numero.match(/^\d+$/).nil?
       numero = numero.to_i
     rescue
        puts 'Debe ingresar un numero'
        retry
     end
    end

    # Y finalmente se imprime cada número dividido por su número entero inmediato anterior
    resultado = numeros.map do |x|
      begin
        x / (x - 1)
      rescue ZeroDivisionError => e
        while x == 1 do
         puts "Ingrese un numero distinto de #{x}"
         x = gets.to_i
        end
        retry
      end
    end
    puts 'El resultado es: %s' % resultado.join(', ')
=end

puts "EJERCICIO 7"
class FormatoIncorrectoError < StandardError


end

cantidad = 0
minimo = 1
while cantidad < minimo
 puts "¿Cuál es la cantidad de números que ingresará? Debe ser al menos #{minimo}"
 begin
   cantidad = Kernel.gets
   raise FormatoIncorrectoError if cantidad.match(/^\d+$/).nil?
   cantidad = cantidad.to_i
 rescue FormatoIncorrectoError => e
    puts "eror del tipo #{e.class}"
    puts 'Debe ingresar un numero'
    cantidad = 0
 end
end

# Luego se almacenan los números
numeros = 1.upto(cantidad).map do
 puts 'Ingrese un número'
 begin
   numero = Kernel.gets
   raise FormatoIncorrectoError if numero.match(/^\d+$/).nil?
   numero = numero.to_i
 rescue FormatoIncorrectoError => e
    puts "eror del tipo #{e.class}"
    puts 'Debe ingresar un numero'
    retry
 end
end

# Y finalmente se imprime cada número dividido por su número entero inmediato anterior
resultado = numeros.map do |x|
  begin
    x / (x - 1)
  rescue ZeroDivisionError => e
    while x == 1 do
     puts "Ingrese un numero distinto de #{x}"
     x = gets.to_i
    end
    retry
  end
end
puts 'El resultado es: %s' % resultado.join(', ')

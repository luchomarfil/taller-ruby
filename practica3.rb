## Practica 3
puts "EJERCICIO 1"
puts <<luchito
    Como esta compuesta la jerarquia de clases que representa
    Ruby para las excepciones?
    Ruby define una jerarquia de excepciones que son subclase de Exception.
    Esta jerarquía simplifica el manejo de excepciones. Se puede lanzar una
    excepcion con cualquiera de las subclases de Exception, o con una propia
    que debe ser subclase de StandardError o alguna de sus hijas. Es decir
    que el padre principal de la rama sea StandardError

    IOError => Se utiliza para tratar problemas de entrada salida, como
               por ejemplo abrir un archivo que no existe, o sobre el cual
               no se tienen permisos. O se intenta leer sobre un archivo
               que ha sido cerrado
               Ejemplo: File.open("does/not/exist")
    NameError => Se levanta cuando se le proporciona a ruby un nombre que
                 no esta definido o que es invalido. O cuando se intenta
                 proporcionar un nombre inválido, por ejemplo el nombre
                 de una constante sobre Fixnum
               Ejemplo: puts variable_no_existente
               Ejemplo: Fixnum.const_set minuscula, 45
    RuntimeError => Es una excepcion generica que se lanza cuando se intentan
              ejecutar operaciones invalidas. Tambien es la excepcion por defecto
              cuando se realiza un raise, sin especificar un tipo de excepcion
    NotImplementedError => Es levantada cuando se ejecuta un metodo no implementado.
              Se suele utilizar para definir metodos que deben ser implementados
              por las subclases. Tambien se utiliza para informar que metodos
              no estan provistos para una plataforma especifica.
    StopIteration => Se levanta para terminar una iteracion. Generalmente sobre
              enumeradores, en ese caso, el mismo loop del enumerador le hace un
              rescue
    TypeError => Se levanta cuando se encuentra un objeto que no es del tipo esperado.
              Ejemplo: 1 + 'a'
    SystemError => Se levanta al ejecutar el comando exit, para iniciar la terminacion
              de un script.
luchito

############## EJERCICIO 2 ####################

puts "EJERCICIO 2"
puts <<manito
¿Cuál es la diferencia entre raise y throw? ¿Para qué usarías una u otra opción?
Raise es utilizado para manejar excepciones, en tanto que throw se utiliza para
manejar el flujo de control de un script. Raise y rescue usan clases. En tanto
que throw y catch utilizan instancias de un objeto
Raise se utiliza cuando lo que se quiere manejar son errores.
Throw se utiliza cuando lo que se desea es cortar la ejecucion de un bloque, o lo
que es mejor cortar de una serie de bloques en cadena. Esto con un throw interno y un
catch bien externo.
manito

puts "EJERCICIO 3"
puts <<sos
¿Para qué sirven begin .. rescue .. else y ensure? Pensá al menos 2 casos concretos en que usarías estas sentencias en un script Ruby.
begin
  # codigo que puede lanzar una excepcion
rescue SomeExceptionClass => some_variable
  # code that deals with some exception
rescue SomeOtherException => some_other_variable
  # code that deals with some other exception
else
  # code that runs only if *no* exception was raised
ensure
  # ensure that this code always runs, no matter what
end
Ejemplo 1: Se podria utilizar el ensure, para asegurarse que una parte del codigo
se ejecute, por ejemplo que se cierre un archivo o una conexion a la base de datos
sin importar cual fue el resultado de la operacion.
Ejemplo 2: Utilizaria el else, para por ejemplo avisar al usuario que todas las operaciones
se corrieron con exito y no hubo errores.
sos

puts "EJERCICIO 4"
puts <<jorgito
¿Para qué sirve retry? ¿Cómo evitarías caer en un loop infinito al usarla?
Si la sentencia retry se encuentra dentro de una cláusula rescue, Ruby vuelve al inicio de una
palabra begin, o un bloque o un metodo y ejecuta nuevamente el código.
La manera de evitar caer en un loop infinito, podria ser o bien ejecutar el retry de manera condicional.
O bien, antes de invocar a retry, modificando las condiciones del programa que terminaron lanzando una excepcion.
Por ejemplo si hubo una division por cero, intentar ver de corregir la cuenta.
jorgito

puts "EJERCICIO 5"
puts <<manteca
¿Cuáles son las diferencias entre los siguientes métodos?
opcion_1 => Retorna un resultado solo si falla, de la otra manera como la ultima sentencia es un puts
            retorna nil
opcion_2 => Siempre retorna nil, haya o no una excepcion, dado que el rescue se hace sobre un bloque q inicia con un
            begin, a continuacion del rescue, se ejecuta lo que esta a continuacion
opcion_3 => El rescue captura cualquier excepcion en el bloque {}, pero ante la primer excepcion, se
            corta la ejecucion del map.
opcion_4 => El rescue al encontrarse dentro del {}, ante una excepcion, el map sigue funcionando. Porque esta a nivel
            de sentencia el rescue y no de bloque

manteca

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

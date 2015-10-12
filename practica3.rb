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

puts "EJERCICIO 6 y 7 en practica3_6y7.rb"
#######################    8    ##########################
puts "EJERCICIO 8"
puts <<explicacion
      Parte 1
        Flujo de impresion:
        * "Entrando a fun1" => porque se invoca desde el script principal
        * "Entrando a fun2" => porque se invoca desde fun1
        * "Entrando a fun3" => porque se invoca desde fun2
        * "Tratando excepción provocada en tiempo de ejecución" => porque se lanza desde fun3 y se captura en fun3
        * "Ejecutando ensure de fun3" => porque asi como se captura RuntimeError Tambien
                                         se determina un comportamiento pase lo que pase, eso es lo que asegura el
                                         ensure
        * "Manejador de excepciones de fun1" => porque en fun 2 hay una division por cero
                                                que no esta manejada
        * "Ejecutando ensure de fun1" => porque asi como se captura RuntimeError, la clausula ensure define un comportamiento
                                         pase lo que pase.
        * "Manejador de excepciones de Main" => porque en el manejador de fun1 se hace un raise nuevamente de la excepcion
                                                que se esta manejando
        * "Correcion de x" => porque es el codigo del manejador de la excepcion que viene desde fun1
        * "Entrando a fun1" => porque se invoa desde el main con el retry nuevamente
        * "Entrando a fun2" => porque se invoca desde fun1
        * "Entrando a fun3" => porque se invoca desde fun2
        * "Tratando excepcion provocada en tiempo de ejecucion" => porque se levanta desde fun3 y se maneja ahi
        * "Ejecutando ensure de fun3" => porque se ejecuta la clausula ensure en fun3 que asegura que un codigo
                                         se ejecute pase lo que pase
        * "Terminando fun2" => porque la division ahora no arroja errores
        * "Ejecutando ensure de fun1" => porque si bien no hubo excepciones eso es lo que asegura la clausula ensure
        * "Puts salida" => porque al no haber excepciones es la ultima linea del script
    Parte 2
        Si se modifica el orden de los manejadores de excepciones, va a suceder que la excepcion va a ser tratada
        por el primer manejador que pueda manejarla. Se va a imprimir Tratando una excepcion cualquiera
    Parte 3
        La palabra retry la funcion que cumple es volver a ejecutar el begin que contiene el bloque de instrucciones
        alcanzados por el rescue. Si corremos la inicializacion de x = 0 dentro del bloque begin, sucede que va a encontrarse
        en un bucle infinito, dado que la solucion de lleva a x = 1 se ve afectada y contradecida con el x = 0
explicacion


puts "PARTE TESTING"
puts "EJERCICIO 1"
puts <<ex
¿En qué consiste la metodología TDD? ¿En qué se diferencia con la forma tradicional de escribir código y luego realizar los tests?
La metodología TDD determina que lo primero que debe escribirse son los tests que cubren el funcionamiento esperado de la aplicacion.
En base a eso, el primer objetivo es que los test fallen y se va desarrollando la funcionalidad que hace pasar los tests. Esto
tiene como dos principales ventajas, que no se escribe codigo que no se va a necesitar, y que toda la funcionalidad critica del sistema
va a estar cubierta por los tests. Ademas el codigo generado queda desarticulado de tal manera que no existe una porcion de código que
resuelva todo, sino que existen pequeñas partes que solucionan cierta funcionalidad del sistema.
ex

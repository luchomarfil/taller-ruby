# EJERCICIO 1
#1 se le aplica al arreglo el metodo sort
puts "### EJERCICIO 1 ###"
def ordenar_arreglo(arr)
    arr.sort
end
p ordenar_arreglo([2,3,5,21,7,2,75,2,68,42,3])
# EJERCICIO 2
puts "### EJERCICIO 2 ###"
# *valores es un parametro splat.
#Se lo puede usar dentro de la funcino sin el asterisco, y representa el uso
#de multiples valores con un solo nombre de parametro
def ordenar(*valores)
    valores.sort
end
#Al momento de invocar al metodo se le pasa una lista de valores
#Internamente el metodo ordenar va a recibir un arreglo de objetos
p ordenar(14,3,2,3,43,2,64,2)

# EJERCICIO 3
puts "### EJERCICIO 3 ###"
entrada = [10, 9, 1, 2, 3, 5, 7, 8]
# Dada `entrada', invocar a #ordenar utilizando sus valores para ordenarlos
# Anteponiendo un * al atributo pasado al metodo, se logra explotar el arreglo
# en una lista de parametros. Como en el ejemplo explotamos un array y agregamos
# Dos lineas parametros mas
p ordenar(*entrada,12,999999)

# EJERCICIO 4
puts "### EJERCICIO 4 ###"
def longitud(*params)
  params.each do |variable|
      puts "#{variable.to_s} --> #{variable.to_s.size}"
  end
end

longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)
# Debe imprimir:
# "9" --> 1
# "2015-09-07 21:04:10 +0000" --> 25
# "Hola" --> 4
# {:un=>"hash"} --> 13
# ruby -->


# EJERCICIO 5
puts "### EJERCICIO 5 ###"
#Con el igual, proporcioanamos un valor por defecto para el parametro fecha
#Ademas en la implementacion, se hace la diferencia entre fecha y Time.now, eso devuelve segundos
#Se lo pasa a integer y se toma el valor absoluto para que no devuelva valor negativo
def cuanto_falta?(fecha=Time.new(Time.new.year,Time.new.month,Time.new.day,23,59,59))
	((fecha - Time.now  ) / 60).to_i.abs
end

puts cuanto_falta?


#EJERCICIO 6.
# Uno de los errores era haber declarado el hash con simbolos, de esa forma dentro del metodo mover_ficha
# no se podia encotrar la posicion en el tablero de cada jugador.
# El segundo problema era que el metodo mover_ficha, por el else, devolvia en lugar de false
# la ultima expresion evaluada, que era la cantidad de fichas del jugador
# El tercer problema, era que habia un shuffle en cada turno, lo que podia hacer que la coleccion antes de
# iterar, luego de dos iteraciones el jugador azul juege dos veces seguidas.
# El cuarto problema es que si un jugador ganaba, el each continuaba ejecutandose hasta el ultimo elemento de
# la coleccion

#EJERCICIO 7
puts "### EJERCICIO 7 ###"
puts "JUEGO EJERCICIO 6 corregido --> EJERCICIO7"

# Tira un dado virtual de 6 caras
def tirar_dado
  rand 1..6
end

# Mueve la ficha de un jugador tantos casilleros como indique el dado en un tablero virtual de 40 posiciones.
# Si no se recibe la cantidad de casilleros, aprovecho el valor por defecto para ese parámetro para evitar tener que
# llamar a #tirar_dado dentro del cuerpo del método.
def mover_ficha(fichas, jugador, casilleros = tirar_dado)
  fichas[jugador] += casilleros
  if fichas[jugador] > 40
    puts "Gano #{jugador}!!"
    true
  else
    puts "#{jugador} ahora esta en el casillero #{fichas[jugador]}"
    #Se suprime la expresion que evalua la posicion del hash
    fichas[jugador]
    #Se agrega false por el caso que el juego no haya finalizado
    false
  end
end
#se corrige la declaracion del hash
posiciones = { "azul"=>0,"rojo"=>0,"verde"=>0}

finalizado = false
until finalizado
  #Se suprime el shuffle
  ['azul', 'rojo', 'verde'].each do |jugador|
    finalizado = mover_ficha(posiciones, jugador)
    #Se agrega la condicion para cortar el bucle si un jugador gana y finalizado es true
    break if finalizado
  end
end





puts "PARTE DOS - CLASES"
puts "EJERCICIO 8"
class Taller
  def probar(objeto)
    objeto.arrancar
  end
end

class Vehiculo

    attr_accessor :llave_puesta
    def initialize (llave_puesta:)
      @llave_puesta = llave_puesta
    end

    def arrancar
       llave_puesta
    end

end

class Auto < Vehiculo
    attr_accessor :freno_mano, :punto_muerto

    def initialize (llave_puesta:,freno_mano:,punto_muerto:)
        super(llave_puesta:llave_puesta)
        @freno_mano = freno_mano
        @punto_muerto = punto_muerto
    end

    def arrancar
      super && !freno_mano && punto_muerto
    end

end

class Moto < Vehiculo
    attr_accessor :patada
    def initialize (llave_puesta:,patada:)
        super llave_puesta:llave_puesta
        @patada = patada
    end
    def arrancar
      patada
    end

end

class Lancha < Vehiculo

end


puts Taller.new.probar(Lancha.new(llave_puesta:true))
#Auto no arranca
puts Taller.new.probar(Auto.new(llave_puesta:true,punto_muerto:true,freno_mano:true))

puts "Si se podria, el taller podria probar una motosierra. Basandose en el concepto de duck typing. No se requiere de
Una jerarquia para poder entender un mensaje. Cada objeto responde al mensaje de acuerdo a como sepa hacerlo"

puts "EJERCICIO 9"
puts <<eos
Include, lo que hace es agregar todos los metodos definidos dentro de un modulo como metodos de instancia
de la clase que esta incluyendo el modulo
Extends, en cambio lo que hace es extender el comportamiento de la clase, agregando todos los metodos del modulo
como metodos de clase
eos

puts "EJERCICIO 10"
module Reverso
  def di_tcejbo
    self.object_id.to_s.reverse
  end
  def ssalc
    self.class.name.reverse
  end
end

class String
  include Reverso

end
str = "hola como va"
puts str.class.name + "  " + str.ssalc
puts str.object_id.to_s + "   " + str.di_tcejbo


puts "EJERCICIO 11"
puts <<eos
11. Implementá el Mixin `Countable` que te permita hacer que cualquier clase cuente la cantidad de veces que los
    métodos de instancia definidos en ella es invocado. Utilizalo en distintas clases, tanto desarrolladas por vos como
    clases de la librería standard de Ruby, y chequeá los resultados. El Mixin debe tener los siguientes métodos:
  1. `count_invocations_of(sym)`: método de clase que al invocarse realiza las tareas necesarias para contabilizar las
     invocaciones al método de instancia cuyo nombre es `sym` (un símbolo).
  2. `invoked?(sym)`: método de instancia que devuelve un valor booleano indicando si el método llamado `sym` fue
     invocado al menos una vez en la instancia receptora.
  3. `invoked(sym)`: método de instancia que devuelve la cantidad de veces que el método identificado por `sym` fue
     invocado en la instancia receptora.
eos

module Foo

  def self.included(base)
    base.extend(ClassMethods)
  end

  def foo_method
    puts "Enviado123123"
    self.class.sym    
  end

  module ClassMethods
    attr_accessor :sym
    def count_invocations_of(sym)
      @sym = sym
      class_eval do
        alias_method @sym, :foo_method
        alias_method :foo_method, @sym
      end
    end
  end

end

class Bebida
  include Foo
  def hola()
    print "hola como va" +  eqwrewrawe + 3
    raise "error"
  end

  count_invocations_of :hola
end

Bebida.new.hola

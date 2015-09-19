#3
puts "EJERCICIO 3"
def reemplazar(aString)
	aString.gsub("{", "do\n").gsub("}", "\nend")
end


#4
puts "EJERCICIO 4"
def conversor(theTime)
	case theTime.min
	when 0..10
		hora = "Son las #{theTime.hour} en punto"
	when 11..20
		hora =  "Son las #{theTime.hour} y cuarto"
	when 21..34
		hora =  "Son las #{theTime.hour} y media"
	when 35..44
		hora = "Son las #{theTime.hour + 1} menos veinticinco"
	when 45..55
		hora = "Son las #{theTime.hour + 1} menos cuarto"
	when 56..59
		hora = "casi las #{theTime.hour + 1}"
	end
end

conversor(Time.now)


#5
puts "EJERCICIO 5"
def contar(frase, buscada)
	frase.scan(/#{buscada}/).count
end


#6
puts "EJERCICIO 6"
def contar_palabras(frase, buscada)
	frase.scan(/\b#{buscada}\b/).count
end


#7.1
puts "EJERCICIO 7.1"
def inverso(palabrita)
	palabrita.reverse
end

#7.2
puts "EJERCICIO 7.2"
def quitaEspacios(palabrita)
	palabrita.gsub(/\s/, "")
end


#7.3
puts "EJERCICIO 7.3"
def conversor_ascii(chars)
	chars.gsub(/./){|s| s.ord.to_s + ' '}
end


#7.4
puts "EJERCICIO 7.4"
def vocales(unStr)
	unStr.gsub(/[aeiou]/, 'a'=>4,'e'=>3,'i'=>'1','o'=>0,'u'=>6)
end


#8
puts "EJERCICIO 8"
def ejercicio8
	[:upcase, :downcase, :capitalize, :swapcase].map do |meth|
	"TTPS Opcion Ruby".send(meth)
	end
end


#9
puts "EJERCICIO 9"
def longitud(arreglo)
	arreglo.map { |e| e.size }
end


#10
puts "EJERCICIO 10"
def a_ul(hashloco)
	"<ul>"<< \
	hashloco.inject("") do |str,(clave, valor)|
		str<<"<li>#{clave}: #{valor}</li>"
	end \
	<<"</ul>"
end


#11
puts "EJERCICIO 11"
def rot13(unStr)
	unStr.gsub(/[a-zA-Z]/) {|car| (car.ord + 13).chr}
end


#12
puts "EJERCICIO 12"
def mapa_rot(cantidad)
  mapeo = {}
  ("A".."Z").each do |s|
		relativo = s.ord + cantidad
    if (s.ord + cantidad)>"Z".ord
        relativo = "A".ord + (s.ord - "Z".ord) - 1
		end
     mapeo[s.downcase] = relativo.chr.downcase
     mapeo[s] = relativo.chr
  end
  mapeo
end

def rot13(frase)
   mapeo = mapa_rot(13)
   frase.gsub(/[a-zA-Z]/,mapeo)
end

def rot(frase,cantidad)
  mapeo = mapa_rot(cantidad)
  frase.gsub(/[a-zA-Z]/,mapeo)
end

puts "Prueba rot"
puts rot13("Bienvenidos a la cursada 2015 de TTPS Opcion Ruby")
puts rot("Hola como va",0)
puts rot("Hola como va",1)


#13
puts "EJERCICIO 13"
def entrada()
  puts "Por favor, ingresa tu nombre"
  nombre = gets
  puts "Hola, #{nombre}"
end


#14
puts "EJERCICIO 14"
def notacion_hexadecimal(rgb_array)
    result = "\#"
    rgb_array.each {| c | result <<  "%02x" % c}
    result.upcase
end

def notacion_entera(rgb_array)
    mult = 0
    result = 0
    rgb_array.each do | c |
          result += c * (256**mult)
          mult=mult+1
    end
    result
end


#15
puts "EJERCICIO 15"
class ClaseMeta
  def initialize(edad)
      @edad = edad
  end
end

cl = ClaseMeta.new(34)
p "metodos de clase #{cl.class.methods[0..1]}..."
p "metodos #{cl.methods[0..1]}..."
p "variables instancia #{cl.instance_variables[0..1]}..."
p "clases ancestras #{cl.class.ancestors[0..1]}..."

#Ejercicio numero 16
puts "EJERCICIO 16"
def suma(tope)
  (1..tope).select{|n| n % 3 == 0 || n % 5 == 0}.inject(0) do |sum,v|
      sum + v
  end
end

puts suma(5)

#Ejercicio numero 17
puts "EJERCICIO 17"
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

#Ejercicio numero 18
=begin
multiplicacion_tres_digitos = Enumerator.new do |caller|
        i1, i2 = 100, 100
        loop do
            caller.yield i1*i2
            if i2==999
                i2 = i1
                i1 = i1 + 1
            else
                i2 = i2 + 1
            end
        end
end
=end
puts "EJERCICIO 18"

def multiplicar_rango(min,max)
  i1, i2 = min, min
  while i1 <= max
      yield i1*i2
      if i2==max
          i2 = i1 + 1
          i1 = i1 + 1
      else
          i2 = i2 + 1
      end
  end
end

valor = nil
multiplicar_rango(100,999) do |m|
  	valor =  m if (m.to_s == m.to_s.reverse) && (valor==nil || valor < m)
end
puts "El palindromo mas grande entre numeros de tres cifras es...#{valor}"

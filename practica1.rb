def reemplazar(bloque)
    bloque.gsub(/\{/,"do").gsub(/}/,"end")
end

def en_palabras(hora)
  case hora.min
  when 1..10
    puts "Son las #{Time.now.hour} en punto"
  when 11..20
    puts "Son las #{Time.now.hour} y cuarto"
  when 21..34
    puts "Son las #{Time.now.hour} y media"
  when 35..44
    puts "Son las #{Time.now.hour+1} menos veinticinco"
  when 45..55
    puts "Son las #{Time.now.hour+1} menos cuarto"
  when 56..59
    puts "Casi las #{Time.now.hour}"
  end
end

def contar(frase,palabra)
   frase.downcase.scan(/#{palabra}/).size
end
def contar_palabras(frase,palabra)
  frase.downcase.scan(/\b#{palabra}\b/).size
end

puts contar("lalala va La la la la casa la","la")
puts contar_palabras("es La casa de La princesa la sofia ", "la")
puts en_palabras(Time.now)
puts reemplazar "6.times { puts \"hola\" }"
#Ejercicio 7
#7.1
puts "hola como va".reverse
#7.2
puts "   hola como va   ".strip
#7.3
"aa".each_codepoint {|c| print c, ' ' }
#7.4
'aeiou'.gsub(/[aeiou]/, 'a'=>4,'e'=>3,'i'=>'1','o'=>0,'u'=>6)
#8
#Map sobre el arreglo de simbolos, ejecuta el bloque de codigo
#Ejecuta para cada elemento del arreglo y retorna un nuevo arreglo con
#Los resultados de cada posicion
[:upcase, :downcase, :capitalize, :swapcase].map do |meth|
 "TTPS Opcion Ruby".send(meth)
end
#9
def longitud(arreglo)
  arreglo.map do | str |
    str.size
  end
end
puts ""
puts "Ejercicio 9"
p longitud(['TTPS', 'Opcion', 'Ruby', 'Cursada 2015'])

#10
def a_ul(un_hash)
   str = "<ul>"
   un_hash.each do | c, v|
      str += "<li>#{c}:#{v}</li>"
   end
   str += "</ul>"
end

p a_ul({perros:1,gatos:2})

#11
def mapa_rot(cantidad)
  #frase.gsub(/[a-zA-Z]/) {|s| (s.ord + 13).chr}
  mapeo = {}
  ("A".."Z").each do |s|
     relativo = (s.ord + cantidad)
     if(relativo.ord>"Z".ord)
         relativo = "A".ord + (relativo.ord - "Z".ord) - 1
     end
     mapeo[s.downcase] = relativo.chr.downcase
     mapeo[s.upcase] = relativo.chr.upcase
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

puts "Ejercicio 11"
puts rot13("Bienvenidos a la cursada 2015 de TTPS Opcion Ruby")
puts rot("Hola como va",0)
puts rot("Hola como va",1)

#13
def entrada()
  puts "Por favor, ingresa tu nombre"
  nombre = gets
  puts "Hola, #{nombre}"
end

#entrada

#14
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

puts notacion_hexadecimal([1,3,4])
puts notacion_hexadecimal([0, 128, 255])
puts notacion_entera([0, 128, 255])

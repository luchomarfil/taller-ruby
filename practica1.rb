#####################################################3##################################################
def reemplazar(aString)
	aString.gsub("{", "do\n").gsub("}", "\nend")
end


#####################################################4##################################################
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


#####################################################5##################################################
def contar(frase, buscada)
	frase.scan(/#{buscada}/).count
end


#####################################################6##################################################
def contar_palabras(frase, buscada)
	frase.scan(/\b#{buscada}\b/).count
end


#####################################################7.1##################################################
def inverso(palabrita)
	palabrita.reverse
end

#####################################################7.2##################################################
def quitaEspacios(palabrita)
	palabrita.gsub(/\s/, "")
end


#####################################################7.3##################################################
def conversor_ascii(chars)
	chars.gsub(/./){|s| s.ord.to_s + ' '} 
end


#####################################################7.4##################################################
def vocales(unStr)
	unStr.gsub(/[aeiou]/, 'a'=>4,'e'=>3,'i'=>'1','o'=>0,'u'=>6)
end


#####################################################8##################################################
def ejercicio8
	[:upcase, :downcase, :capitalize, :swapcase].map do |meth|
	"TTPS Opción Ruby".send(meth)
end


#####################################################9##################################################
def longitud(arreglo)
	arreglo.map { |e| e.size }
end


#####################################################10##################################################
def a_ul(hashloco)
	"<ul>"<< \
	hashloco.inject("") do |str,(clave, valor)|
		str<<"<li>#{clave}: #{valor}</li>"
	end \
	<<"</ul>"
end


#####################################################11##################################################
def rot13(unStr)
	unStr.gsub(/[a-zA-Z]/) {|car| (car.ord + 13).chr}
end


#####################################################12##################################################
def mapa_rot(cantidad)
  #frase.gsub(/[a-zA-Z]/) {|s| (s.ord + 13).chr}
  mapeo = {}
  ("A".."Z").each do |s|
    relativo = if relativo.ord>"Z".ord 
        "A".ord + (relativo.ord - "Z".ord) - 1
      else
        (s.ord + cantidad)
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

puts "Ejercicio 11"
puts rot13("Bienvenidos a la cursada 2015 de TTPS Opcion Ruby")
puts rot("Hola como va",0)
puts rot("Hola como va",1)


#####################################################13##################################################
def entrada()
  puts "Por favor, ingresa tu nombre"
  nombre = gets
  puts "Hola, #{nombre}"
end


#####################################################14##################################################
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


#####################################################15##################################################
def ClaseMeta
  def new(edad)
      @edad = edad
  end
end

cl = ClaseMeta.new
cl.class.methods
cl.methods
cl.instance_variables
cl.class.ancestors


#####################################################16##################################################
def suma_naturales(tope)
	(1..tope).select{|elem| (elem % 3) == 0 || (elem % 5) == 0}.inject(0){|sum, e| sum + e}  
end

#####################################################17##################################################
def fibonacci

end
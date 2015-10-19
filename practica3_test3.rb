def en_palabras(theTime)
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

def contar(frase, buscada)
	if (buscada == "")
		0
	else
		frase.downcase.scan(/#{buscada.downcase}/).count
	end
end

def contar_palabras(frase, buscada)
	if (buscada == "")
		0
	else	
		frase.scan(/\b#{buscada}\b/).count
	end
end

def longitud(arreglo)
	arreglo.map { |e| e.size }
end

def ordenar_arreglo(arr)
    arr.sort
end

def ordenar(*valores)
    valores.sort
end

def longitud(*params)
  params.each do |variable|
      puts "#{variable.to_s} --> #{variable.to_s.size}"
  end
end

module Oposite
  def opposite
    !self
  end

end

class TrueClass
  include Oposite
end
class FalseClass
  include Oposite
end


def da_nil?
  yield == nil
end

puts da_nil? {}
puts da_nil? {"Algo distinto de nil"}

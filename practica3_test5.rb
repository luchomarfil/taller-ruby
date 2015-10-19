def expansor(str)
	raise("La entrada no es un string") unless str.is_a? String
	raise("El string es vacío") if str == ""
	raise("El formato del string es incorrecto") if str.match(/\d/)
	raise("El formato del string es incorrecto") if str == "*"
	str.split("").map{|elem| elem * (elem.ord - 96)}.join("")
end
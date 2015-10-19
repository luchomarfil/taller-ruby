require_relative 'practica3_test3.rb'
require 'minitest/autorun'
require 'minitest/spec'
###############################--2.4--######################################
describe "en_palabras - cuando recive la hora 9:00" do 
	it "debe retornar son las nueve en punto " do
		hora =  en_palabras(Time.new(2002, 10, 31, 9, 0, 0, "-03:00"))
		assert_equal("Son las 9 en punto", hora)
	end

it "debe retornar son casi las 10 " do
		hora =  en_palabras(Time.new(2002, 10, 31, 9, 56, 0, "-03:00"))
		assert_equal("casi las 10", hora)
	end
end

describe "en_palabras - cuando recive valores entre las 10:00 y las 10:10" do 
	it "debe retornar son las nueve en punto" do
		(1..10).each do |minuto|
			hora =  en_palabras(Time.new(2002, 10, 31, 10, minuto, 0, "-03:00"))
			assert_equal("Son las 10 en punto", hora)
		end
	end
end


###############################--3.5--######################################
describe "contar - cuando la expresion a buscar es un string comun" do 
	it "debe retornar la cantidad de veces que se encuentra la expresion en la frase" do
		assert_equal(3, contar("la lupa de lalo landa", "la"))
	end

	it "no debe discriminar entre mayusculas o minusculas" do
		assert_equal(3, contar("LA lupa de Lalo lAnda", "la"))
		assert_equal(3, contar("LA lupa de Lalo lAnda", "LA"))
		assert_equal(3, contar("LA lupa de Lalo lAnda", "lA"))
		assert_equal(3, contar("LA lupa de Lalo lAnda", "La"))
	end
end

describe "contar - cuando la expresion a buscar es ''" do 
	it "debe retornar " do
		assert_equal(0, contar("tu novia la zorra", ""))
	end
end



###############################--4.6--######################################
describe "contar_palabras - cuando la expresion a buscar es un string comun" do 
	it "debe retornar la cantidad de veces que se encuentra la palabra expresion, en la frase" do
		assert_equal(1, contar_palabras("la casa es buena", "la"))
	end

		it "debe tener en cuenta que la expresion sea una palabra, y no parte de una" do
		assert_equal(1, contar_palabras("la casa es bella y Lalo landa tambien", "la"))
	end
end

describe "contar_palabras - cuando la expresion a buscar es ''" do 
	it "debe retornar " do
		assert_equal(0, contar_palabras("your momma", ""))
	end
end



describe "longitud" do 
	it "" do

	end
end

describe "ordenar_arreglo" do 
	it "" do

	end
end

describe "ordenar - cuando la lista de números a ordenar no es vacia" do 
	it "debe retornar un arreglo con la misma cantidad de elementos" do
		assert_equal(3, ordenar(3,4,5).count)
	end

	it "debe retornar un arreglo con los elementos ordenados" do
		assert_equal([1,2,3,5], ordenar(2,1,5,3))
	end
end

describe "longitud" do 
	it "" do

	end
end

describe "opposite" do 
	it "" do

	end
end

describe "da_nil?" do 
	it "" do

	end
end



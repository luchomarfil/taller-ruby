require_relative 'practica3_test5.rb'
require 'minitest/autorun'
require 'minitest/spec'

describe 'expansor' do
  # Casos de prueba con situaciones y/o entradas de datos esperadas
  describe 'Casos felices' do
    describe 'cuando la entrada es el string "a"' do
      it 'debe devolver "a"' do
        assert_equal("a", expansor("a"))
      end
    end

    describe 'cuando la entrada es el string "f"' do
      it 'debe devolver "ffffff"' do
        assert_equal("ffffff", expansor("f"))
      end
    end

    describe 'cuando la entrada es el string "escoba"' do
      it 'debe devolver "eeeeessssssssssssssssssscccooooooooooooooobba"' do
        assert_equal("eeeeessssssssssssssssssscccooooooooooooooobba", expansor("escoba"))
      end
    end
  end

  # Casos de pruebas sobre situaciones inesperadas y/o entradas de datos anómalas
  describe 'Casos tristes' do
    describe 'cuando la entrada no es un string' do
      it 'debe disparar una excepción estándar con el mensaje "La entrada no es un string"' do
        ex = assert_raises(RuntimeError){expansor(7)}
        assert_equal(ex.message, "La entrada no es un string")
        # assert_raise_with_message(RuntimeError, "La entrada no es un string"){expansor(7)}
      end
    end

    describe 'cuando la entrada es el string vacío' do
      it 'debe disparar una excepción estándar con el mensaje "El string es vacío"' do
        ex = assert_raises(RuntimeError){expansor("")}
        assert_equal(ex.message, "El string es vacío")
        # assert_raise_with_message(RuntimeError, "El string es vacío"){expansor("")}
      end
    end

    describe 'cuando la entrada es el string "9"' do
      it 'debe disparar un excepción estándar con el mensaje "El formato del string es incorrecto"' do
        ex = assert_raises(RuntimeError){expansor("9")}
        assert_equal(ex.message, "El formato del string es incorrecto")
        # assert_raise_with_message(RuntimeError, "El formato del string es incorrecto"){expansor("9")}
      end  
    end

    describe 'cuando la entrada es el string "*"' do
      it 'debe disparar una excepción estándar con el mensaje "El formato del string es incorrecto"' do
        ex = assert_raises(RuntimeError){expansor("*")}
        assert_equal(ex.message, "El formato del string es incorrecto")  
        # assert_raise_with_message(RuntimeError, "El formato del string es incorrecto"){expansor("*")}
      end
    end
  end
end
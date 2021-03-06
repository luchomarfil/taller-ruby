module Countable

  def self.included(base)
    base.extend(ClassMethods)
  end

  def invoked(sym)
  	@contador[sym]
  end

  module ClassMethods
    def count_invocations_of(sym)
		 viejo = "viejo_#{sym}"
         alias_method sym, viejo
	     		 
		 define_method(sym) do
		 	self.contador ||= Hash.new(0)  
		 	self.contador[sym] += 1	
		 	puts self.contador
		 	puts "UNO"	 	 
		 	puts sym
		 	send viejo
		 end
		 
    end
  end
  
  protected
  
  attr_accessor :contador
end

class Bebida
  include Countable
  def hola()
    puts "REAL"
  end

  count_invocations_of :hola
end

a = Bebida.new
a.hola
a.hola
a.hola
a.invoked(:hola)


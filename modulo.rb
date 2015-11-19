class VowelFinder
    include Enumerable
    def initialize(string)
        @string = string
    end

end
vf = VowelFinder.new "El murcielago tiene todas"
#vf.inject(:+)

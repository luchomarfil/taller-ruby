def incrementar (x, delta=1)
	raise if x.is_a? String
	z = x + delta
	z
end

def concatenar(*args)
	aux = args.inject("") {|ac, e| ac << e.to_s.strip.gsub(/[\t\n\r]/, '') << " "}.strip
	aux.gsub(/[\s]{1,}/, " ")
end


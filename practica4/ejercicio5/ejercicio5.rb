require 'bundler'
Bundler.require
 
get '/' do
	"* /mcm/a/b => muestra el minimo comun multiplo entre a b
	 <br>
	 * /mcd/a/b => muestra el maximo comun divisor entre a y b
	 <br>
	 * /sum/* => calcula la sumatoria de todos los valores del splat que recive
	 <br>
	 * /even/* => presenta la cantidad de numeros pares que recive del splat
	 <br>
	 * /random => calcula un numero random y lo envia por POST
	 <br>
	 * /random/lower/upper => devuelve un valor random entre lower y upper
	 "
end

get '/mcm/:a/:b' do |a, b|
	multiplo = a.to_i.lcm(b.to_i)
	"muestra el minimo comun multiplo entre #{a} y #{b} => #{multiplo}"
end

get '/mcd/:a/:b' do |a, b|
	divisor = a.to_i.gcd(b.to_i)
	"muestra el maximo comun divisor entre #{a} y #{b} => #{divisor}"
end

get '/sum/*' do
	spl = params[:splat][0].split("/").map{|a| a.to_i}.inject(:+)
	"calcula la sumatoria de todos los valores => #{spl}"
end

get '/even/*' do
	spl = params[:splat][0].split("/").map{|a| a.to_i}.select{|elem| elem.even?}.size
	"presenta la cantidad de numeros pares => #{spl}"
end

post '/random' do
	"#{rand(0..1000)}"
end

post '/random/:lower/:upper' do |lower, upper|
	random = rand(lower.to_i..upper.to_i)
	"#{random}"
end
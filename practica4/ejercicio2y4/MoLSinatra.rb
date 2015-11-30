require 'bundler'
Bundler.require
 
get '/' do
	random = rand(1..42)
  status random==42? 200:404
  body "#{random}"
end
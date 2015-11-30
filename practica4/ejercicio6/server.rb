# Agregando al Gemfile gem 'rack-contrib'
require 'bundler'
require_relative 'tachador.rb'
Bundler.require

use Tachador

get '/hello' do
    'Mi Dni es 30575948 tengo 20 años de edad, y 7 novias'
end


get '/hello2' do
    'Hello World 2'
end

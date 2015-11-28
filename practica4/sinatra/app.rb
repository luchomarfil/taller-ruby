require 'bundler'
Bundler.require

get '/' do

  puts App::routes

end

get %r{/hello/([\w]*)/?} do
    s = params[:captures]
    "hello world #{s}"
end

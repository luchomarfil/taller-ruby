require 'bundler'
Bundler.require
 
app = Proc.new do |env|
		random = rand(1..42)
		status = '200'
		status = '404' unless random == 42
    [status, {'Content-Type' => 'text/html'}, [random.to_s]]
end
 
Rack::Handler::WEBrick.run app
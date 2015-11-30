class Tachador

  def initialize(app)
        @app = app
  end

  def imprimir(env)
    env.each{|c, v| puts "clave:#{c} clase#{c.class} valor: #{v}"}
  end

  def call(env)
    # began_at = Time.now
    puts @app.class
    # env['REQUEST_URI'] = "http://localhost:9393/hello2"
    #puts env['REQUEST_URI']
    # imprimir(env)
    status, header, body = @app.call(env)
    # imprimir(env)
    puts "Status class: "<<status.class.to_s
    puts "Status value:"<<status.to_i
    [status, header, body] unless status.inspect == 200
#    [status, header, ocultar_numeros(body,'X')]
    [status, header,[ocultar_numeros(body,"X")]]
  end

  def ocultar_numeros(b,char)
        b[0] = b[0].gsub(/[0-9]/,"a")
        b[0]
  end

end

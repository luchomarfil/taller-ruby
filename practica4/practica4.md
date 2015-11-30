1- Una gema es un formato simple para compartir y distribuir codigo Ruby. Tiene una estructura estandar con los siguientes componentes.

Una parte de codigo  
/lib => Codigo ruby de la gema
/test => Test para la funcionalidad de la gema
Una parte de ejecutables
/bin => Donde se encuentran los ejecutables que provee la gema
Una parte de descripcion (Gemspec,Readme.md,Licencia)
Readme.md => Documentación del proyecto, changelog, instalación, modo de uso
proyecto.gemspec => Contiene informacion sobre la gema (Autor, plataforma, version, numero)

2-
Gems   => Gestor de paquetes para instalar gemas en el sistema
Bundle => Gestor para manejar, instalar y actualizar las dependencias de una aplicacion mediante un archivo Gemfile

Las diferencias son:
1- Gems es de uso estandar en Ruby, es su gestor de gemas, en tanto Bundle es una gema que debe instalarse mediante el comando gem.
Ambos permiten instalar gemas, pero Bundle haciendo uso de un archivo realiza la instalación de una manera mas ágil, cómoda, más práctica.
Ademas Bundle permite administrar las versiones de cada gema, que va a utilizar la aplicacion. Ademas se pueden manejar diversos entornos, como puede ser :test, :development, y cada uno con su configuración específica.
Como objetivo base hacen lo mismo: instalar dependencias.
Gems es mas de bajo nivel, permite solamente administrar las gemas instaladas.
Bundle agrega la posibilidad de administrar qué versiones de las gemas a instalar/instaladas debe utilizar la aplicacion.

3-


4- Por un lado te muestra todas las gemas que tenes instaladas en tu maquina, con la posibilidad de acceder a la documentación oficial de cada una, todo esto lo hace levanto un webserver. Y por otro lado te permite transformar tu maquina en un servidor de gemas para que otras maquinas puedan instalar gemas usando la tuya como servidor.

5-
Como solución a este problema, propongo un set simple de reglas y requerimientos que dictan cómo asignar y cómo aumentar los números de versión. Para que este sistema funcione, tienes que declarar primero un API pública. Esto puede consistir en documentación o ser explicitado en el código mismo. De cualquier forma, es importante que esta API sea clara y precisa. Una vez que identificaste tu API pública, comunicas cambios a ella con aumentos específicos al número de versión. Considera un formato de versión del tipo X.Y.Z (Major.Minor.Patch) Los arreglos de bugs que no cambian el API incrementan el patch, los cambios y adiciones que no rompen la compatibilidad de las dependencias anteriores incrementan el minor, y los cambios que rompen la compatibilidad incrementan el major.

4- La versión major en cero (0.y.z) es para desarrollo inicial. Cualquier cosa puede cambiar en cualquier momento. El API pública no debiera ser considerada estable.

5-La versión 1.0.0 define el API pública. La forma en que el número de versión es incrementado después de este release depende de esta API pública y de cómo esta cambia.

6-La versión patch Z (x.y.Z | x > 0) DEBE incrementarse cuando se introducen solo arreglos compatibles con la versión anterior. Un arreglo de bug se define como un cambio interno que corrige un comportamiento erróneo.

7-La versión minor Y (x.Y.z | x > 0) DEBE ser incrementada si se introduce nueva funcionalidad compatible con la versión anterior. Se DEBE incrementar si cualquier funcionalidad de la API es marcada como deprecada. PUEDE ser incrementada si se agrega funcionalidad o arreglos considerables al código privado. Puede incluir cambios de nivel patch. La versión patch DEBE ser reseteada a 0 cuando la versión minor es incrementada.

8-La versión major X (X.y.z | X > 0) DEBE ser incrementada si cualquier cambio no compatible con la versión anterior es introducida a la API pública. PUEDE incluir cambios de niver minor y/o patch. Las versiones patch y minor DEBEN ser reseteadas a 0 cuando se incrementa la versión major.


Fuente: http://semver.org/lang/es/



7-
1- El archivo Gemfile permite especificar mediante un DSL (Domain Specific Languague) un conjunto de dependencias a utilizar por la aplición. Ademas permite especificar la version y de que source se van a obtener, esto puede un gem server remoto, o una url de git por ejemplo.
Ademas permite manejar grupos diferentes que pueden requerir distintas gemas, o distintas versiones de gemas.
2- Source permite especificar de dónde se obtienen las gemas requeridas. Un Gemfile permite agregar multiples lineas de sources, de manera global, o para una gema o grupo de gemas en particular.
Si se especifican multiples sources, estos utilizan para localizar las gemas desde el ultimo al primero agregado
3-La version que se instalo es la ultima disponible. Si despues se publica una nueva version de la libreria colorputs, hasta tanto no se haga un bundle update, o se reinstale la gema con un  gem install, la gema va a seguir siendo la misma. Gemfile permite especificar el semver específico o tambien utilizar comodines para permitir un rango de versiones posibles.
En el caso especifico de evitar que suba la version major de colorputs, se deberia especificar en el Gemfile de la siguiente manera:

      gem 'colorputs', '~>0.2' #Esto equivale a decir que colorputs >= 0.2.0 < 1.0

Fuente: http://bundler.io/gemfile.html

Most of the version specifiers, like >= 1.0, are self-explanatory. The specifier ~> has a special meaning, best shown by example. ~> 2.0.3 is identical to >= 2.0.3 and < 2.1. ~> 2.1 is identical to >= 2.1 and < 3.0. ~> 2.2.beta will match prerelease versions like 2.2.beta.12.

6 - bundle install => Instala las dependencias especificadas en Gemfile, a la version especificada
    bundle update  => Actualiza las dependencias instaladas a la ultima version especificada segun Gemfile


Sinatra
-------

1- Rack provee una interface minima, modular y adaptable para desarrollar aplciaciones webs en ruby. Provee una manera estandar de manejar request y responses HTTP. Es utilizada por frameworks, webservers y middlewares.
Rack especifica que un request se debe poder manejar con una simple invocacion a un metodo call. Y ademas que la respuesta provista por ese metodo call, debe constar de tres partes
1. El status code
2. Un hash de headers
3. Un body response



3- Quiere decir que al ser una DSL agrega sintaxis propia con el propósito de facilitar el desarrollo de aplicaciones web. Con Sinatra es fácil especificar una api para un servidor web y como debe compartarse para cada metodo distinto del protocolo HTTP. Ademas agrega la posibilidad de parsear los requests, o de redirigir dependiendo de expresiones regulares presentes en el request. Tambien puede discriminar de acuerdo al tipo de contenido que acepta el cliente que realiza el request
DSL => Domain specific lenguaje. ES un lenguaje propio basado en Ruby que agrega sintaxis propia para facilitar el desarrollo de tareas especificas. Gemfile tambien define un DSL propio

4- Preguntar si se podria haber realizado como el probability del ejemplo de las ppts

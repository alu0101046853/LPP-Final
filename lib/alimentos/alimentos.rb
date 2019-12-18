#Clase Alimento la cual representa un alimento con sus atibutos
class Alimento
	#Incluimos el modulo Comparable para poder comparar objetos de la misma clase	
	include Comparable
	
	#El constructor de la clase Alimento
	def initialize(nombre,proteinas,carbo,lipidos,gases,terreno)
		#Variable con el nombre del Plato
		@nombre = nombre
		#Gramos de Proteinas
		@proteinas = proteinas
		#Gramos de Carbohidratos
		@carbo = carbo
		#Gramos de lipidos
		@lipidos = lipidos
		#Emisones de Gases del Alimento
		@gases = gases
		#Uso de Terreno del Alimento
		@terreno = terreno
	end
	
	#Un attr_reader para poder acceder a los atributos en forma de lectura
	attr_reader :nombre, :gases, :terreno, :proteinas,:carbo,:lipidos
	
	#La Funcion para comparar distintos Alimento
	def <=> (otro)
		valor_energetico <=> otro.valor_energetico
	end
	
	#El formateado del Alimento
	def to_s
	 "#{@nombre}: #{@proteinas}, #{@carbo}, #{@lipidos}, #{@gases}, #{@terreno}"
 	end

	#Funcion para calcular el valor energetico del Alimento
	def valor_energetico
		valor=(4.0 * @carbo) + (9.0 * @lipidos) + (4.0 * @proteinas)
		valor.round(1)
	end

	#Funcion Para calcular el impacto del alimento en la dieta diara de un hombre
	def impacto_hombre
		imp=valor_energetico/3000*100
		imp.round(1)
	end

	#Funcion Para calcular el impacto del alimento en la dieta diara de una Mujer
	
	def impacto_mujer
		imp=valor_energetico/2400*100
		imp.round(1)
	end	
end

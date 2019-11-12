class alimento
	def initialize(nombre,proteinas,carbo,lipidos,gases,terreno)
		@nombre = nombre
		@proteinas = proteinas
		@carbo = carbo
		@lipidos = lipidos
		@gases = gases
		@terreno = terreno
	end

	def to_s
	 " #{@nombre}: #{@proteinas}, #{@carbo}, #{@lipidos}, #{@gases}, #{@terreno}"
 	end	
end

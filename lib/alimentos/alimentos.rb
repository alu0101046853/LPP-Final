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

	def valor_energetico
		valor=(4*@carbo) + (9*@lipidos) + (4*@proteinas)
	end	
end

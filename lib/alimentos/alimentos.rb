class Alimento
	def initialize(nombre,proteinas,carbo,lipidos,gases,terreno)
		@nombre = nombre
		@proteinas = proteinas
		@carbo = carbo
		@lipidos = lipidos
		@gases = gases
		@terreno = terreno
	end
	
	attr_reader :nombre, :gases, :terreno

	def to_s
	 "#{@nombre}: #{@proteinas}, #{@carbo}, #{@lipidos}, #{@gases}, #{@terreno}"
 	end

	def valor_energetico
		valor=(4.0 * @carbo) + (9.0 * @lipidos) + (4.0 * @proteinas)
		valor.round(1)
	end

	def impacto_hombre
		imp=valor_energetico/3000*100
		imp.round(1)
	end

	def impacto_mujer
		imp=valor_energetico/2400*100
		imp.round(1)
	end	
end
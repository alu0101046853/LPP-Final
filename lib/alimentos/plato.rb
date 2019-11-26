class Plato
	include Comparable

	def initialize(nombre,alimentos,gramos)
		@nombre=nombre
		@alimentos = Lista.new(0)
		@alimentos.insertar_array(alimentos)
		@gramos = Lista.new(0)
		@gramos.insertar_array(gramos)
	end

	attr_reader :nombre,:alimentos,:gramos

	def <=> (otro)
		valor_energetico <=> otro.valor_energetico
	end

	def proteinas
		nproteinas=0
		aux =@alimentos.head
		auxgramos = @gramos.head
		while(aux!=nil)
			nproteinas += aux.value.proteinas * (auxgramos.value/(aux.value.proteinas+aux.value.lipidos+aux.value.carbo))
			aux = aux.next
			auxgramos = auxgramos.next
		end
		(nproteinas/gramos_totales*100).round(1)
	end

	def lipidos
		lipidos=0
		aux = @alimentos.head
		auxgramos = @gramos.head
		while(aux!=nil)
			lipidos += aux.value.lipidos * (auxgramos.value/(aux.value.proteinas+aux.value.lipidos+aux.value.carbo))
			aux = aux.next
			auxgramos = auxgramos.next
		end
		(lipidos/gramos_totales*100).round(1)
	end

	def hidratos
		carbo = 0
		aux = @alimentos.head
		auxgramos = @gramos.head
		while(aux!=nil)
			carbo += aux.value.carbo * (auxgramos.value/(aux.value.proteinas+aux.value.lipidos+aux.value.carbo))
			aux = aux.next
			auxgramos = auxgramos.next
  		end
		  (carbo/gramos_totales*100).round(1)
	end

	def gramos_totales
		gramostotales=0
		aux = @gramos.head
		while(aux!=nil)
			gramostotales+= aux.value
			aux = aux.next
		end
		gramostotales.round(1)
	end

	def valor_energetico
		valor=0
		aux = @alimentos.head
		auxgramos = @gramos.head
		while(aux!=nil)
			valor += aux.value.valor_energetico * (auxgramos.value/(aux.value.proteinas+aux.value.lipidos+aux.value.carbo))
			aux = aux.next
			auxgramos = auxgramos.next
		end
		valor.round(1)
	end

	def to_s
		"#{@nombre} : #{proteinas},#{hidratos},#{lipidos}"
	end
end

class PlatoEficiencia < Plato
	
	def initialize(nombre,alimentos,gramos)
		super(nombre,alimentos,gramos)
	end

	def gases
		valor=0
		aux = @alimentos.head
		while(aux!=nil)
			valor += aux.value.gases
			aux = aux.next
		end
		valor
	end

	def terreno
		valor=0
		aux = @alimentos.head
		while(aux!=nil)
			valor += aux.value.terreno
			aux = aux.next
		end
		valor
	end

	def to_s
		"#{@nombre} : #{proteinas},#{hidratos},#{lipidos},#{gases},#{terreno}"
	end
end

# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

#Clase para representar una Lista doblemente enlazada
class Lista

	#Incluimos el modulo Enumerable para poder enumerar la clase Lista
	include Enumerable

	#El contructor de la clase
	def initialize(tamano)
		#El nodo en la cabaze de la Lista
		@head=nil
		#El nodo en la cola de la Lista
		@tail=nil
		#El tamano de la Lista
		@tamano=tamano
	end

	#Funcion att_reader para acceder a los atributos de la clase
	attr_reader :head,:tail,:tamano

	#Insertamos un Valor en la Lista por la cola
	def insertar(valor)
		nodo = Node.new(valor,nil,nil)
		if @tamano == 0
			nodo.next=nil
			nodo.prev=nil
			@head=nodo
			@tail=nodo
			@tamano+=1
		else
			nodo.prev = @tail 
			nodo.next = nil
			@tail.next = nodo 
			@tail = nodo
			@tamano += 1
		end
	end

	#Funcion para extraer la cabeza de la Lista
	def extract_head
		if @head == nil
			return nil
		elsif @head == @tail
			aux = @head
			@tail = nil
			@head = nil
			@tamano = 0
			return aux
		else
			aux = @head
			@head = aux.next
			@head.prev = nil
			@tamano-=1
			return aux
		end
	end

	#Funcion para extraer la cola de la Lista
	def extract_tail
		if @tail == nil
			return nil
		elsif @head == @tail
			aux = @tail
			@tail = nil
			@head = nil
			@tamano = 0
			return aux
		else
			aux = @tail
			@tail = aux.prev
			@tail.next = nil
			@tamano-=1
			return aux
		end
	end

	#Funcion para insertar varios elementos seguidos en forma de array
	def insertar_array(array)
		for x in 0..array.length-1
			insertar(array[x])
		end
	end

	#Formateado de la clase Lista
	def to_s
		"Lista : #{@header},#{@tail},#{@tamano}"
	end

	#Funcion Each para el recorrido del Enumerable
	def each
		aux = @head
		while(aux != nil)
			yield aux.value
			aux = aux.next
		end
	end
end

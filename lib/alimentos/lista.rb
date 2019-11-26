# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

class Lista

	attr_reader :head,:tail,:tamano

	include Enumerable

	def initialize(tamano)
		@head=nil
		@tail=nil
		@tamano=tamano
	end

	attr_reader :head,:tail,:tamano

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

	def insertar_array(array)
		for x in 0..array.length-1
			insertar(array[x])
		end
	end

	def to_s
		"Lista : #{@header},#{@tail},#{@tamano}"
	end

	def each
		aux = @head
		while(aux != nil)
			yield aux.value.valor_energetico
			aux = aux.next
		end
	end
end

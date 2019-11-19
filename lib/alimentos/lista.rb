# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

class Lista
	def initialize(tamano)
		@head=nil
		@tail=nil
		@tamano=tamano
	end

	def insertar(valor)
		nodo = Node.new(valor,nil,nil)
		if self.empty
			nodo.next=nil
			nodo.prev=nil
			@head=nodo
			@tail=nodo
			@tamano+=1
		else
			nodo.prev = @tail
			nodo.next=nil
			@tail.next = nodo
			@tail = nodo
			@tamano += 1
		end
	end
end

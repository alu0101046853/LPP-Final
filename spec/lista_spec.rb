RSpec.describe Alimentos do
	before :all do
		@alimento1 = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@alimento2 = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
		@alimento3 = Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
		@alimento4 = Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
		@lista = Lista.new(0)
	end

	describe "Inserccion de nodos" do
		it "Elementos Bien insertados" do
			@lista.insertar(@alimento1)
			expect(@lista.head.value.nombre).to eq("Carne de Vaca")
			@lista.insertar(@alimento2)
			expect(@lista.tail.value.nombre).to eq("Tofu")
			@lista.insertar(@alimento3)
                        expect(@lista.tail.value.nombre).to eq("Lentejas")
			@lista.insertar(@alimento4)
                        expect(@lista.tail.value.nombre).to eq("Chocolate")
		end
	end
end

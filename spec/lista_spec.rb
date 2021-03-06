RSpec.describe Lista do
	before :each do
		@alimento1 = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@alimento2 = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
		@alimento3 = Alimento.new("Lentejas",23.5,52.0,1.4,0.4,3.4)
		@alimento4 = Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
		@lista = Lista.new(0)
		@array = [@alimento1,@alimento2,@alimento3,@alimento4]
	end

	context "Inserccion de nodos" do
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

		it "Elementos insertados de una vez" do
			@lista.insertar_array(@array)
			expect(@lista.tail.value.nombre).to eq("Chocolate")
		end
	end

	context "Extraccion de head y tail" do
		it "Head bien extraido" do
			@lista.insertar_array(@array)
			expect(@lista.extract_head.value.nombre).to eq("Carne de Vaca")
			expect(@lista.head.value.nombre).to eq("Tofu")
		end

		it "Tail Bien extraido" do
                        @lista.insertar_array(@array)
                        expect(@lista.extract_tail.value.nombre).to eq("Chocolate")
                        expect(@lista.tail.value.nombre).to eq("Lentejas")
                end

	end

	context "Dietas con Listas" do
		it "Efecto invernadero diario" do
			@lista.insertar_array(@array)
			expect((@lista.extract_head.value.gases + @lista.extract_head.value.gases + @lista.extract_head.value.gases + @lista.extract_head.value.gases).round(1)).to eq(54.7)
		end

		it "Efecto Invernadero Anual" do
			@lista.insertar_array(@array)
			expect((@lista.extract_head.value.gases + @lista.extract_head.value.gases + @lista.extract_head.value.gases + @lista.extract_head.value.gases * 365).round(1)).to eq(891.9)
		end

		it "Uso de Metro cuadrado de la dieta" do
			 @lista.insertar_array(@array)
			 expect((@lista.extract_head.value.terreno + @lista.extract_head.value.terreno + @lista.extract_head.value.terreno + @lista.extract_head.value.terreno).round(1)).to eq(173.0)
		end
	end

	context "Pruebas con Enumerable" do
		it"Pruebas con enumerable correctas" do
			@lista.insertar_array(@array)
			expect(@lista.min).to eq(@alimento2)
			expect(@lista.max).to eq(@alimento4)
			expect(@lista.sort).to eq([@alimento2,@alimento1,@alimento3,@alimento4])
			expect(@lista.select{|i| i.valor_energetico.between?(100,400)}).to eq([@alimento1,@alimento3])
			expect(@lista.collect{|i| i.nombre}).to eq(["Carne de Vaca","Tofu","Lentejas","Chocolate"])	
		end
	end
end

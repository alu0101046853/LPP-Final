RSpec.describe Plato do
	describe "Plato Bien Montado" do
		before :all do
                @carne = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
                @plato = Plato.new("Carne con Tofu",[@carne,@tofu],[200,100])
		end

	 	it "Nombre Bien cojido" do
			expect(@plato.nombre).to eq("Carne con Tofu")
		end
		
		it "Porcentajes de Proteinas,Lipidos e Hidratos" do
			expect(@plato.proteinas).to eq(76.3)
			expect(@plato.lipidos).to eq(19.4)
			expect(@plato.hidratos).to eq(4.3)
		end

		it "Valor Calorico Total" do
			expect(@plato.valor_energetico).to eq(1491.4)
		end

		it "To_s Bien Realizado" do
			expect(@plato.to_s).to eq("Carne con Tofu : 76.3,4.3,19.4")
		end
	end

	describe "Pruebas de Herencia" do
		before :all do
		@carne = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
                @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
		@platoh = PlatoEficiencia.new("Carne con Tofu",[@carne,@tofu],[200,100])
		end

		it "Pruebas de Gases y Terreno" do
			expect(@platoh.gases).to eq(52.0)
			expect(@platoh.terreno).to eq(166.2)
		end

		it "To_s Realizado" do
			expect(@platoh.to_s).to eq("Carne con Tofu : 76.3,4.3,19.4,52.0,166.2")
		end

		it "Comprobacion de Jerarquia y Clases" do
			expect(@platoh.is_a? PlatoEficiencia).to eq(true)
			expect(@platoh.kind_of? Plato).to eq(true)
		end
	end

	describe "Pruebas De Compare and Enumerar" do
		before :all do
		@carne = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
                @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
                @lentejas = Alimento.new("Lentejas",23.5,55.0,1.4,0.4,3.4)
                @choco = Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
                @queso = Alimento.new("Queso",25.0,0.0,33.0,11.0,41.0)
                @leche = Alimento.new("Leche de Vaca",3.3,8.0,3.2,3.2,8.9)
                @salmon = Alimento.new("Salmon",19.9,0.0,13.6,6.0,3.7)
		@platoespanola = Plato.new("Carne de Vaca con Tofu",[@carne,@tofu],[100,500])
                @platovasca = Plato.new("Salmon y Lentejas",[@salmon,@lentejas],[200,100])
                @platovegeta = Plato.new("Leche con Chocolate",[@choco,@leche],[200,50])
                @platolocura = Plato.new("Carne con Lentejas",[@carne,@lentejas],[300,300])

                @dietaconplatos = Lista.new(0)
		end

		it "Comparar bien" do
			expect(@platoespanola >= @platovegeta).to be true
			expect(@platovasca < @platovegeta).to be false
			expect(@platolocura <= @platovasca).to be false
		end

		it "Enumerar los platos de distintas dietas" do
			@dietaconplatos.insertar_array([@platoespanola,@platovegeta,@platovasca,@platolocura])
			expect(@dietaconplatos.max).to eq(3280.4)
			expect(@dietaconplatos.min).to eq(1419.7)
			expect(@dietaconplatos.sort).to eq([1419.7,1614.7,2618.4,3280.4])
			expect(@dietaconplatos.select {|i| i.between?(1500,3000)}).to eq([1614.7,2618.4])	
		end
	end	
end

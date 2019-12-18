RSpec.describe Plato do
	before :each do
		@carne = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
                @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
                @lentejas = Alimento.new("Lentejas",23.5,55.0,1.4,0.4,3.4)
                @choco = Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
                @queso = Alimento.new("Queso",25.0,0.0,33.0,11.0,41.0)
                @leche = Alimento.new("Leche de Vaca",3.3,8.0,3.2,3.2,8.9)
                @salmon = Alimento.new("Salmon",19.9,0.0,13.6,6.0,3.7)
		@platoespanola = Plato.new("Carne de Vaca con Tofu",[@carne,@tofu],[100,50])
                @platovasca = Plato.new("Salmon y Lentejas",[@salmon,@lentejas],[20,10])
                @platovegeta = Plato.new("Leche con Chocolate",[@choco,@leche],[20,50])
                @platolocura = Plato.new("Carne con Lentejas",[@carne,@lentejas],[30,30])
		@menu = [@platoespanola,@platovasca,@platovegeta,@platolocura]
		@precios = [10.0,22.5,2.6,15.9]
	end

	context "Array de Platos y Precios" do
		it "Huella Nutricional Maxima en Arrays" do
			maximo = @menu.collect{|i| i.huella}.max
			array = @menu.select{|i| i.huella.equal?(maximo)}
			platomax = array.pop
			expect(platomax).to eq(@platoespanola)
		end

		it "Incremento Precio Arrays" do
			maximo = @menu.collect{|i| i.huella}.max
			array = @menu.select{|i| i.huella.equal?(maximo)}
			platomax = array.pop
			indice = @menu.index(platomax)
			preciomax = @precios[indice]
			expect(preciomax).to eq(10.0)
			expect(@precios.collect{|i| i * (preciomax*0.2)}).to eq([20.0,45.0,5.2,31.8])	
		end
	end
end	

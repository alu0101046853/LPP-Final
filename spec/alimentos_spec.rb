RSpec.describe Alimentos do
<<<<<<< HEAD
	before (:all) do
		@carnevaca = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@choco = Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
	end

	context "Probando readers y to_s" do
=======
before (:all) do
		@carnevaca = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		@choco = Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
	end 

context "Probando readers y to_s" do
>>>>>>> desarrollos
		it "Readers bien" do
			expect(@carnevaca.gases).to eq(50.0)
			expect(@carnevaca.nombre).to eq("Carne de Vaca")
			expect(@carnevaca.terreno).to eq(164.0)
		end

		it "to_s funciona" do
			expect(@carnevaca.to_s).to eq("Carne de Vaca: 21.1, 0.0, 3.1, 50.0, 164.0")
		end
	end

	context "Probando Valor energetico" do
		it "Valor energetico bien calculado" do
			expect(@carnevaca.valor_energetico).to eq(112.3)
		end

		it "Impacto de Hombre Correcto" do
			expect(2*@carnevaca.impacto_hombre+4*@choco.impacto_hombre).to eq(71.4)
		end

		it "Impacto de mujer Correcto" do
			expect(4*@carnevaca.impacto_mujer+2*@choco.impacto_mujer).to eq(58.8)
		end
<<<<<<< HEAD
	end	
=======
	end
 
>>>>>>> desarrollos
end

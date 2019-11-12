RSpec.describe Alimentos do
	before (:all) do
		@carnevaca = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
	end

	context "Probando readers y to_s" do
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
			expect(@carnevaca.impacto_hombre).to eq(3.7)
		end

		it "Impacto de mujer Correcto" do
			expect(@carnevaca.impacto_mujer).to eq(4.7)
		end
	end	
end

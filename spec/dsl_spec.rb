RSpec.describe Platodsl do
	before :all do
		@plato = Platodsl.new("Hamburguesa") do
			nombre		"Hamburguesa con Papas Fritas"
			alimento	:descripcion => "Carne"
					:gramos => 100
		end
	end

	context "Probando constructor DSL" do
		it "Constructor bien hecho" do
			expect(@plato.nombre).to eq("Hamburguesa con Papas Fritas")
		end
	end
end

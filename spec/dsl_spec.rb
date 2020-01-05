RSpec.describe Platodsl do
	before :all do
		@plato = Platodsl.new("Hamburguesa") do
			titulo		"Hamburguesa con Huevo"
			alimento	:descripcion => "Carne de Vaca",
					:prote => 21.1,
					:carbo => 0.0,
					:lipidos => 3.1,
					:gases => 50.0,
					:terreno => 164.0,
					:gramos => 100
			alimento	:descripcion => "Huevo",
					:prote => 5.0,
					:carbo => 1.1,
					:lipidos => 2.1,
					:gases => 3.5,
					:terreno => 2.6,
					:gramos => 10
		end
		@plato2 = Platodsl.new("Papas") do
			titulo		"Papas con salsa"
			alimento	:descripcion => "Papas Fritas",
					:prote => 6.3,
					:carbo => 19.2,
					:lipidos => 2.1,
					:gases => 12.0,
					:terreno => 1.2,
					:gramos => 100
			alimento	:descripcion => "Salsa",
					:prote => 5.0,
					:carbo => 20.1,
					:lipidos => 4.2,
					:gases => 3.5,
					:terreno => 0.5,
					:gramos => 10
		end
		@menu = Menu.new("Combinado de Hamburguesa") do
			componente 	:plato => "Hamburguesa de la casa",
					:precio => 3.50
			componente	:plato => "Papas fritas con salsa",
					:precio => 2.50
			precio		6.00
		end
	end

	context "Probando constructor DSL" do
		it "Constructor bien hecho" do
			expect(@plato.nombre).to eq("Hamburguesa con Huevo")
			expect(@plato.proteinas).to eq(84.8)
		end

		it "To_s bien" do
			expect(@menu.to_s).to eq("Combinado de Hamburguesa = 6.0€\nContiene: \nHamburguesa de la casa = 3.5€\nPapas fritas con salsa = 2.5€\n")
			expect(@plato.to_s).to eq("Valor Nutricional del plato: Hamburguesa con Huevo\nValor energetico: 516.9\nValor ambiental: 1\n")
			expect(@plato2.to_s).to eq("Valor Nutricional del plato: Papas con salsa\nValor energetico: 485.2\nValor ambiental: 1\n")
		end
	end
end

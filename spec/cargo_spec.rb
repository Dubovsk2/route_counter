require_relative '../lib/cargo'
require_relative '../lib/distance_calculator'
require 'rspec'
require 'geocoder'
require 'open-uri'

describe "Cargo" do
  let(:cargo) do
    Cargo.new(weight: 15, lenght: 50, width: 30, height: 15, departure: 'popova 63 saransk russia', destination: 'lenina 12 novgorod russia')
  end

  describe "::new" do
    it 'assigns variables correctly' do
      expect(cargo.weight).to eq(15)
      expect(cargo.lenght).to eq(50)
      expect(cargo.width).to eq(30)
      expect(cargo.height).to eq(15)
      expect(cargo.departure).to eq('popova 63 saransk russia')
      expect(cargo.destination).to eq('lenina 12 novgorod russia')
    end
  end

  describe "#price_per_kilo" do
    it 'calculates correctly' do
      expect(cargo.price_per_kilo).to eq(1)
    end
  end

  describe "#volume" do 
    it 'should be truthy' do
      expect(cargo.volume).to eq(0.0225)
    end
  end

  describe "#distance" do
    it 'returns the correct class' do
      expect(cargo.distance).to be_a(String)
    end

    it 'returns the correct value for distance' do
      expect(cargo.distance).to eq("543.1 km")
    end
  end

  describe "#return_info" do
    it 'returns the correct class' do
      expect(cargo.return_info).to be_a(Hash)
    end

    it 'checks the hash values' do
      expect(cargo.return_info).to match(
        a_hash_including(
          :distance => "543.1 km",
          :height => 15,
          :lenght => 50,
          :price => 1,
          :weight => 15,
          :width => 30
        ))
    end
  end
end

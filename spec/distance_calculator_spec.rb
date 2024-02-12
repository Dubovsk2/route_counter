require_relative '../lib/cargo'
require_relative '../lib/distance_calculator'
require 'rspec'
require 'geocoder'
require 'open-uri'

describe Distance_calculator do
  describe "::calculate_distance_through_distancematrix" do
    it 'returns the right value of object' do
      expect(Distance_calculator.calculate_distance_through_distancematrix('popova 63 saransk russia', 'lenina 12 novgorod russia')).to eq("543.1 km")
    end
    
    it 'checks the right class' do
      expect(Distance_calculator.calculate_distance_through_distancematrix('popova 63 saransk russia', 'lenina 12 novgorod russia')).to be_a(String)
    end
  end
end
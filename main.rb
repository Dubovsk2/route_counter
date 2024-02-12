require 'geocoder'
require 'open-uri'
require_relative 'lib/cargo'
require_relative 'lib/distance_calculator'

cargo_info = {}

print "Enter cargo weight(kg): "
cargo_info[:weight] = gets.to_i
print "Enter cargo lenght(sm): "
cargo_info[:lenght] = gets.to_i
print "Enter cargo width(sm): "
cargo_info[:width] = gets.to_i
print "Enter cargo hight(sm): "
cargo_info[:height] = gets.to_i

print "Enter cargo departure point(format: street bld city country): "
cargo_info[:departure] = gets.chomp
print "Enter cargo destination point(format: street bld city country): "
cargo_info[:destination] = gets.chomp

cargo = Cargo.new(cargo_info)
puts cargo.return_info




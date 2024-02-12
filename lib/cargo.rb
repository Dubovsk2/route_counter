class Cargo
  attr_reader :weight, :lenght, :width, :height, :departure, :destination

  def initialize(params)
    @weight = params[:weight]
    @lenght = params[:lenght]
    @width = params[:width]
    @height = params[:height]
    @departure = params[:departure]
    @destination = params[:destination]
  end

  def price_per_kilo
    price = volume < 1 ? 1 : 2
    price += 1 if @weight >= 10 && price != 1
    return price
  end

  def volume
    volume_sm3 = @lenght * @width * @height
    volume_m3 = volume_sm3 * 0.000001
    return volume_m3
  end

  def distance
    Distance_calculator.calculate_distance_through_distancematrix(@departure, @destination)
  end

  def return_info
    {weight: 15, lenght: 50, width: 30, height: 15, distance: distance, price: price_per_kilo}
  end
end
module Contribute::ProblemsHelper
  def popularity_color(popularity)
    gradient_color(popularity.to_i)
  end

  def gradient_color(value)
    # Ensure value is between 0 and 100
    value = [[value, 100].min, 0].max
    
    # Define RGB for orange and green
    orange = [255, 165, 0]
    green = [0, 255, 0]

    # Calculate the RGB values for the color
    rgb = []
    3.times do |i|
      rgb[i] = ((1 - value/100.0) * orange[i] + (value/100.0) * green[i]).round
    end
    
    # Convert RGB to Hex
    "#" + rgb.map { |c| c.to_s(16).rjust(2, '0') }.join
  end
end

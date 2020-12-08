#!/usr/bin/env ruby
# frozen_string_literal: true

require './map'
require './toboggan'

total = 1
slides = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

slides.map do |x, y|
  map = Map.new 'map_input.txt'
  toboggan = Toboggan.new

  while toboggan.location[:y] < map.y_size - 1
    toboggan.slide(x: x, y: y)

    toboggan.location[:x] %= map.x_size

    toboggan.hit_tree if map.tree?(x: toboggan.location[:x], y: toboggan.location[:y])
  end

  total *= toboggan.tree_hits
  puts "Slide x: #{x} - y: #{y} - tree hits: #{toboggan.tree_hits}"
end

puts "TOTAL: #{total}"

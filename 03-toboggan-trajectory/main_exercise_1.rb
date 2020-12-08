#!/usr/bin/env ruby
# frozen_string_literal: true

require './map'
require './toboggan'

map = Map.new 'map_input.txt'
toboggan = Toboggan.new

while toboggan.location[:y] < map.y_size - 1
  toboggan.slide

  toboggan.location[:x] %= map.x_size

  toboggan.hit_tree if map.tree?(x: toboggan.location[:x], y: toboggan.location[:y])
end

puts map
puts toboggan.tree_hits

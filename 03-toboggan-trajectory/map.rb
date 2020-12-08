#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open-uri'

class Map
  TREE = '#'
  def initialize(uri)
    @map = URI.open(uri).readlines.map(&:chomp)
  end

  def tree?(x:, y:)
    if @map[y][x] == TREE
      @map[y][x] = 'X'
      return true
    else
      @map[y][x] = 'O'
      return false
    end
  end

  def x_size
    @map[0].length
  end

  def y_size
    @map.length
  end

  def to_s
    @map.join("\n")
  end
end

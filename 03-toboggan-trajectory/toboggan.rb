#!/usr/bin/env ruby
# frozen_string_literal: true

class Toboggan
  attr_reader :tree_hits

  def initialize(x: 0, y: 0)
    @position = { x: x, y: y }
    @tree_hits = 0
  end

  def slide(x: 3, y: 1)
    @position[:x] += x
    @position[:y] += y

    @position
  end

  def location
    @position
  end

  def hit_tree
    @tree_hits += 1
  end
end

#!/usr/bin/env ruby
# frozen_string_literal: true

require './adapter'
require 'open-uri'

input = URI.open('input.txt').readlines.map(&:to_i)
adapter = Adapter.new(input)

puts "Number of 1-jolt differences multiplied by the number of 3-jolt differences: #{adapter.multiply_differences}"

#!/usr/bin/env ruby
# frozen_string_literal: true

require './adapter'
require 'open-uri'

input = URI.open('input.txt').readlines.map(&:to_i)
adapter = Adapter.new(input)

puts "Number of arrangements: #{adapter.count_arrangements}"

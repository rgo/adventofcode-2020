#!/usr/bin/env ruby
# frozen_string_literal: true

require './bag_calculator'
require 'open-uri'

input = URI.open('input.txt').read

bag_calculator = BagCalculator.new(rules: input, bag_color: 'shiny gold')

puts bag_calculator.combinations_count

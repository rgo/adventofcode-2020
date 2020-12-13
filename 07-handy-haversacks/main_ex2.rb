#!/usr/bin/env ruby
# frozen_string_literal: true

require './bag_calculator_ex2'
require 'open-uri'

input = URI.open('input.txt').read

bag_calculator = BagCalculator.new(rules: input, bag_color: 'shiny gold')

puts bag_calculator.count_required_bags

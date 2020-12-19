#!/usr/bin/env ruby
# frozen_string_literal: true

require './xmas'
require 'open-uri'

input = URI.open('input.txt').readlines.map(&:to_i)

xmas = Xmas.new(preamble: 25, input: input)

puts "Invalid number: #{xmas.invalid}" unless xmas.valid?

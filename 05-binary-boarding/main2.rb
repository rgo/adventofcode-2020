#!/usr/bin/env ruby
# frozen_string_literal: true

require './bin_boarding'
require 'open-uri'

boarding_passes = URI.open('input.txt').read.split("\n")

seats = boarding_passes.map do |boarding_pass|
  BinBoarding.new(boarding_pass).seat_id
end.sort

seats.each_with_index do |seat_id, i|
  break if i + 1 > seats.size - 1

  puts seat_id+1 if seats[i+1] - seat_id == 2 && seats[i+2] != seats[i+1]
end

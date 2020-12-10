#!/usr/bin/env ruby
# frozen_string_literal: true

require './bin_boarding'
require 'open-uri'

boarding_passes = URI.open('input.txt').read.split("\n")

puts boarding_passes.map { |boarding_pass| BinBoarding.new(boarding_pass).seat_id }.max

#!/usr/bin/env ruby
# frozen_string_literal: true

require './passport_validations'
require 'open-uri'

inputs = URI.open('input.txt').read.split("\n\n")

valids = 0

inputs.each do |input|
  passport = Passport.new(input)
  valids += 1 if passport.valid?
end

puts valids

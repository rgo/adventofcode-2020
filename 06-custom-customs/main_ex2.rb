#!/usr/bin/env ruby
# frozen_string_literal: true

require './custom_declaration'
require 'open-uri'

inputs = URI.open('input.txt').read.split("\n\n")

total =  inputs.inject(0) { |sum, input| sum + CustomDeclaration.new(input).count_all_yes_questions }

puts total

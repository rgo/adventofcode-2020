#! /usr/bin/env ruby
# frozen_string_literal: true

require './password_validator'
require './password_validator_fixed.rb'
require 'open-uri'

input = URI.open('passwords.txt').readlines

puts "Valid passwords exercise 1: #{PasswordValidator.validate(input).size}"
puts "Valid passwords exercise 2: #{PasswordValidatorFixed.validate(input).size}"

#! /usr/bin/env ruby
# frozen_string_literal: true

require './password_validator'
require 'open-uri'

input = URI.open('passwords.txt').readlines

puts "Valid passwords: #{PasswordValidator.validate(input).size}"

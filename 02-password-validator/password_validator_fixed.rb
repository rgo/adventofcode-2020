#! /usr/bin/env ruby
# frozen_string_literal: true

# Exercise 2
class PasswordValidatorFixed
  LINE_FORMAT = /(?<min>\d+)-(?<max>\d+) (?<char>\w+): (?<password>\w+)/.freeze

  def self.validate(input)
    Array(input).select do |line|
      valid_line? line
    end
  end

  def self.parser(line)
    line.match LINE_FORMAT
  end

  def self.valid_line?(line)
    parsed_line = parser(line)
    min_char = parsed_line[:password][parsed_line[:min].to_i - 1]
    max_char = parsed_line[:password][parsed_line[:max].to_i - 1]

    min_char != max_char &&
      (min_char == parsed_line[:char] ||
      max_char == parsed_line[:char])
  end
end

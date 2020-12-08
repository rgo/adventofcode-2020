#! /usr/bin/env ruby
# frozen_string_literal: true

class PasswordValidator
  LINE_FORMAT = /(?<min>\d+)-(?<max>\d+) (?<char>\w+): (?<password>\w+)/.freeze

  def self.validate(input)
    Array(input).select do |line|
      parsed_line = parser(line)
      valid_line? parsed_line
    end
  end

  def self.parser(line)
    line.match LINE_FORMAT
  end

  def self.valid_line?(parsed_line)
    count_chars = parsed_line[:password].count(parsed_line[:char])

    count_chars >= parsed_line[:min].to_i && count_chars <= parsed_line[:max].to_i
  end
end

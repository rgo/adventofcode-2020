# frozen_string_literal: true

# !/usr/bin/env ruby

class ExpenseReport
  SUM = 2020

  def initialize(input)
    @input = input.map(&:to_i)
  end

  def find_wrong_entries
    @input.each_with_index do |entry, index|
      next if entry > SUM

      wanted_value = SUM - entry
      @input[index..-1].each do |value|
        return @wrong_values = [entry, wanted_value] if value == wanted_value
      end
    end
  end

  def calculate
    @wrong_values ||= find_wrong_entries
    @wrong_values.inject(:*)
  end
end

# frozen_string_literal: true

# !/usr/bin/env ruby

class ExpenseReport
  SUM = 2020

  def initialize(input)
    @input = input.map(&:to_i)
  end

  def calculate(n_entries)
    combinations = @input.combination(n_entries)
    wrong_entries = combinations.find { |v| v.inject(:+) == SUM }
    wrong_entries.inject(:*)
  end
end

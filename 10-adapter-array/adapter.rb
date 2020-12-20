# frozen_string_literal: true

class Adapter
  def initialize(input)
    @input = input.map(&:to_i).sort
    @built_in_joltage = @input.max + 3
    @charging_outlet_joltage = 0
  end

  def differences_finder
    differences = Hash.new(0)

    ([@charging_outlet_joltage] + @input + [@built_in_joltage]).each_cons(2) do |smaller, bigger|
      differences['1'] += 1 if bigger - smaller == 1
      differences['3'] += 1 if bigger - smaller == 3
    end
    differences
  end

  def multiply_differences
    differences_finder.values.reject(&:zero?).inject(:*)
  end

  # Tribonacci sequence
  # I read it https://www.reddit.com/r/adventofcode/comments/ka8z8x/2020_day_10_solutions/gfcsgdy/
  def count_arrangements
    counter = Hash.new(0)

    counter[0] = 1

    ([@charging_outlet_joltage] + @input).each.with_index do |jolt, i|
      next if i.zero?

      counter[jolt] = counter[jolt - 1] + counter[jolt - 2] + counter[jolt - 3]
    end

    counter.values.last
  end
end

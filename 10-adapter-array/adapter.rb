# frozen_string_literal: true

class Adapter
  def initialize(input)
    @input = input.map(&:to_i).sort
  end

  def differences_finder
    built_in_joltage = @input.max + 3
    charging_outlet_joltage = 0
    differences = Hash.new(0)

    ([charging_outlet_joltage] + @input + [built_in_joltage]).each_cons(2) do |smaller, bigger|
      differences['1'] += 1 if bigger - smaller == 1
      differences['3'] += 1 if bigger - smaller == 3
    end
    differences
  end

  def multiply_differences
    differences_finder.values.reject(&:zero?).inject(:*)
  end
end

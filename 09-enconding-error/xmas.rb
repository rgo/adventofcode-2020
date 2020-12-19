# frozen_string_literal: true

class Xmas
  def initialize(input:, preamble:)
    @input = input
    @preamble = preamble
  end

  def valid?
    @input.each_cons(@preamble + 1) do |packet|
      value = packet[-1]
      preamble = packet[0..-2]

      if preamble.combination(2).none? { |pair| pair.sum == value }
        puts "Number #{value} is invalid"
        return false
      end
    end

    true
  end
end

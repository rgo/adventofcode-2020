# frozen_string_literal: true

class Xmas
  attr_reader :invalid

  def initialize(input:, preamble:)
    @input = input
    @preamble = preamble
  end

  def valid?
    @input.each_cons(@preamble + 1) do |packet|
      value = packet[-1]
      preamble = packet[0..-2]

      if preamble.combination(2).none? { |pair| pair.sum == value }
        @invalid = value
        return false
      end
    end

    true
  end
end

# frozen_string_literal: true

require 'spec_helper'
require './xmas'

RSpec.describe Xmas do
  context 'preamble 25 (1..25)' do
    let(:input) { Array(1..25) }

    it '26 would be valid' do
      xmas = Xmas.new(input: input << 26, preamble: 25)

      expect(xmas.valid?).to be true
    end

    it '49 would be valid' do
      xmas = Xmas.new(input: input << 49, preamble: 25)

      expect(xmas.valid?).to be true
    end

    it '100 would be invalid' do
      xmas = Xmas.new(input: input << 100, preamble: 25)

      expect(xmas.valid?).to be false
    end

    it '50 would be invalid' do
      xmas = Xmas.new(input: input << 50, preamble: 25)

      expect(xmas.valid?).to be false
    end
  end

  it '127 is an invalid number' do
    input = %w[35 20 15 25 47 40 62 55 65 95 102 117 150 182 127 219 299 277 309 576].map(&:to_i)

    xmas = Xmas.new(input: input, preamble: 5)

    expect(xmas.valid?).to be false
  end
end

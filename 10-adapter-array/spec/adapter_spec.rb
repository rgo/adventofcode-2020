# frozen_string_literal: true

require 'spec_helper'
require './adapter'

RSpec.describe Adapter do
  let(:short_input) { %w[16 10 15 5 1 11 7 19 6 12 4] }
  let(:big_input) { %w[28 33 18 42 31 14 46 20 48 47 24 23 49 45 19 38 39 11 1 32 25 35 8 17 7 9 4 2 34 10 3] }

  it 'solves short input' do
    adapter = Adapter.new(short_input)

    expect(adapter.differences_finder).to eq({ '1' => 7, '3' => 5 })
  end

  context 'big input' do
    let(:adapter) { Adapter.new(big_input) }
    it 'solves differences' do
      expect(adapter.differences_finder).to eq({ '1' => 22, '3' => 10 })
    end

    it 'multiply differences' do
      expect(adapter.multiply_differences).to eq 220
    end
  end
end

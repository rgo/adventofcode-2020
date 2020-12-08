#!/usr/bin/env ruby
# frozen_string_literal: true

require 'spec_helper'
require './toboggan'

RSpec.describe Toboggan do
  it '#slide' do
    toboggan = Toboggan.new

    expect(toboggan.slide).to eq({ x: 3, y: 1 })
  end

  it '#location' do
    toboggan = Toboggan.new(x: 5, y: 10)

    expect(toboggan.location).to eq({ x: 5, y: 10 })
  end
end

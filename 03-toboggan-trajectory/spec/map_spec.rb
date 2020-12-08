#!/usr/bin/env ruby
# frozen_string_literal: true

require 'spec_helper'
require './map'
require 'open-uri'

RSpec.describe Map do
  let(:map_fixture) { 'spec/map_fixture.txt' }

  it '#three?' do
    map = Map.new(map_fixture)

    expect(map.tree?(x: 0, y: 1)).to be_truthy
    expect(map.tree?(x: 0, y: 0)).to be_falsey
  end
end

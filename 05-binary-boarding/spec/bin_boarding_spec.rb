require 'spec_helper'
require './bin_boarding'

RSpec.describe BinBoarding do
  let(:bin_boarding) { BinBoarding.new('FBFBBFFRLR') }
  it 'extracts the row' do
    expect(bin_boarding.row).to eq 44
  end
  it 'extracts the column' do
    expect(bin_boarding.column).to eq 5
  end
  it 'calculates the seat ID' do
    expect(bin_boarding.seat_id).to eq 357
  end
end

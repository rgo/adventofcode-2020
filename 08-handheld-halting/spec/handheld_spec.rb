# frozen_string_literal: true

require 'spec_helper'
require './handheld'

RSpec.describe Handheld do
  it 'has an accumulator register' do
    registers = Handheld.load('')

    expect(registers[:accumulator]).to eq 0
  end

  context 'instructions' do
    it 'nop does nothing' do
      registers = Handheld.load('nop +0')

      expect(registers[:accumulator]).to eq 0
    end

    context 'acc' do
      it 'increases accumulator' do
        registers = Handheld.load('acc +1')

        expect(registers[:accumulator]).to eq 1
      end
      it 'decreases accumulator' do
        registers = Handheld.load('acc -2')

        expect(registers[:accumulator]).to eq(-2)
      end
    end

    context 'jmp' do
      it 'next x lines'
      it 'go back x lines'
    end

    it 'raises exception for unknown instructions' do
      expect { Handheld.load('mul +42') }.to raise_error(Handheld::ParseError)
    end
  end
end

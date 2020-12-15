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
      it 'next x lines' do
        boot_loader = <<~EOC
          nop +0
          nop +0
          jmp +2
          acc +1
          nop +0
        EOC
        registers = Handheld.load(boot_loader)

        expect(registers[:instruction_pointer]).to eq(5)
        expect(registers[:accumulator]).to eq(0)
      end
      it 'go back x lines' do
        boot_loader = <<~EOC
          jmp +4
          nop +0
          acc +1
          jmp +2
          jmp -2
          nop +0
        EOC
        registers = Handheld.load(boot_loader)

        expect(registers[:instruction_pointer]).to eq(6)
        expect(registers[:accumulator]).to eq(1)
      end
    end

    it 'raises exception for unknown instructions' do
      expect { Handheld.load('mul +42') }.to raise_error(Handheld::ParseError)
    end
  end

  context 'boot loader fixer' do
    it 'replaces jmps by nops' do
      bootloader = <<~EOC
        nop +0
        acc +1
        jmp +4
        acc +3
        jmp -3
        acc -99
        acc +1
        jmp -4
        acc +6
      EOC
      registers = Handheld.load_fixer(bootloader)

      expect(registers[:accumulator]).to eq(8)
    end
  end
end

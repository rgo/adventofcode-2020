# frozen_string_literal: true

module Handheld
  class ParseError < StandardError
  end

  def self.load(code)
    registers = { accumulator: 0 }

    lines = code.split("\n")

    lines.each do |line|
      operation, params = line.split(' ')

      instruction = case operation
                    when 'nop'
                      Instruction::Nop.build(params)
                    when 'acc'
                      Instruction::Acc.build(params)
                    else
                      raise ParseError, "Unknow instruction: #{operation}"
                    end
      instruction.execute(registers)
    end
    registers
  end

  module Instruction
    class Nop
      def self.build(value)
        new(value)
      end

      def initialize(_value) end

      def execute(_register) end
    end

    class Acc
      def self.build(value)
        new(value)
      end

      def initialize(value)
        @value = value.to_i
      end

      def execute(register)
        register[:accumulator] += @value
      end
    end
  end
end

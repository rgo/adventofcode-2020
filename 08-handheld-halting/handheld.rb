# frozen_string_literal: true

module Handheld
  class ParseError < StandardError
  end

  def self.load(code)
    registers = {
      accumulator: 0,
      instruction_pointer: 0,
      accumulator_prev: 0,
      execution_lines: []
    }
    instructions = []

    lines = code.split("\n")

    lines.each do |line|
      operation, params = line.split(' ')

      instruction = case operation
                    when 'nop'
                      Instruction::Nop.build(params)
                    when 'acc'
                      Instruction::Acc.build(params)
                    when 'jmp'
                      Instruction::Jmp.build(params)
                    else
                      raise ParseError, "Unknow instruction: #{operation}"
                    end
      instructions << instruction
    end

    registers[:execution_lines] = Array.new(instructions.size, 0)

    while registers[:instruction_pointer] < instructions.size && registers[:execution_lines].all? { |i| i <= 1 }
      registers[:acc_prev] = registers[:accumulator]
      registers[:execution_lines][registers[:instruction_pointer]] += 1

      instructions[registers[:instruction_pointer]].execute(registers)

      registers[:acc_current] = registers[:accumulator]
    end

    puts "Registers: #{registers.inspect}"
    registers
  end

  module Instruction
    class Nop
      def self.build(value)
        new(value)
      end

      def initialize(_value) end

      def execute(registers)
        registers[:instruction_pointer] += 1
      end
    end

    class Acc
      def self.build(value)
        new(value)
      end

      def initialize(value)
        @value = value.to_i
      end

      def execute(registers)
        registers[:instruction_pointer] += 1
        registers[:accumulator] += @value
      end
    end

    class Jmp
      def self.build(value)
        new(value)
      end

      def initialize(value)
        @value = value.to_i
      end

      def execute(registers)
        registers[:instruction_pointer] += @value
      end
    end
  end
end
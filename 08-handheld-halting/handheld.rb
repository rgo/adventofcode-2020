# frozen_string_literal: true

module Handheld
  class ParseError < StandardError
  end

  def self.load(code)
    instructions = parse_instructions(code)

    run(instructions)
  end

  def self.load_fixer(code)
    registers = {}
    instructions = parse_instructions(code)

    # brute force
    instructions.size.times do |i|
      modified_instructions = instructions.map(&:clone)

      instruction = modified_instructions[i]

      modified_instructions[i] = case instruction
                                 when Instruction::Jmp
                                   Instruction::Nop.build(instruction.value)
                                 when Instruction::Nop
                                   Instruction::Jmp.build(instruction.value)
                                 else
                                   next
                                 end

      registers = run(modified_instructions)
      break if registers[:instruction_pointer] >= instructions.size
    end

    registers
  end

  def self.run(instructions)
    registers = {
      accumulator: 0,
      instruction_pointer: 0,
      accumulator_prev: 0,
      execution_lines: []
    }

    registers[:execution_lines] = Array.new(instructions.size, 0)

    while registers[:instruction_pointer] < instructions.size && registers[:execution_lines].all? { |i| i <= 1 }
      registers[:acc_prev] = registers[:accumulator]
      registers[:execution_lines][registers[:instruction_pointer]] += 1

      instructions[registers[:instruction_pointer]].execute(registers)

      registers[:acc_current] = registers[:accumulator]
    end
    registers
  end

  def self.parse_instructions(code)
    instructions = []
    lines = code.split("\n")

    lines.each do |line|
      operation, params = line.split(' ')

      instructions << instruction_builder(operation, params)
    end
    instructions
  end

  def self.instruction_builder(operation, params)
    case operation
    when 'nop'
      Instruction::Nop.build(params)
    when 'acc'
      Instruction::Acc.build(params)
    when 'jmp'
      Instruction::Jmp.build(params)
    else
      raise ParseError, "Unknow instruction: #{operation}"
    end
  end

  class << self
    private :parse_instructions
    private :instruction_builder
  end

  module Instruction
    class Nop
      attr_reader :value

      def self.build(value)
        new(value)
      end

      def initialize(value)
        @value = value
      end

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
      attr_reader :value

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

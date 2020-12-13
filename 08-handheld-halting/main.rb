#!/usr/bin/env ruby
# frozen_string_literal: true

require './handheld'
require 'open-uri'

boot_loader = URI.open('input.txt').read


puts Handheld.load(boot_loader)

require 'coverage_helper'
require 'minitest/autorun'
require 'turn'
require 'net/ssh/stream'
require 'pry-nav'

Turn.config do |c|
  c.format = :pretty
  c.natural = true
  c.ansi = true
end
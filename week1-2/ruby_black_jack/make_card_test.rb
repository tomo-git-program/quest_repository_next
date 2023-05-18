require_relative "mark.rb"
require_relative "number.rb"
require_relative "pictorial_pattern_error.rb"
require_relative "card.rb"
require_relative "deck.rb"
require_relative "different_instance_error.rb"
require "debug"
require 'minitest/autorun'

class MakeCardTest < Minitest::Test
  def test_make_card
    card = Card.new
    binding.break
    card.make_card("dia")
  end
end
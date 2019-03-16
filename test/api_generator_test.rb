require "minitest/autorun"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"
require "./lib/api_generator"
require "pry"
require "httparty"

class APIGeneratorTest < Minitest::Test



  def  test_generates_cards
    url = "https://opentdb.com/api.php?amount=5&type=multiple
    def test_generates_cards"
    generator = APIGenerator.new(5)
    binding.pry
    assert_instance_of Array, generator.cards
    generator.cards.each{|card| assert_instance_of((Card), card)}
    assert_equal 5, generator.cards.length
  end

  # def test_cards_have_card_qualities
  #   generator = APIGenerator.new("./files/cards.yaml")
  #   binding.pry
  #   assert_equal "What is 5 + 5?" , generator.cards[0].question
  #
  #   assert_equal "10" , generator.cards[0].answer
  #   assert_equal :STEM , generator.cards[0].category
  #   assert_equal "What cardboard cutout lives at Turing?" , generator.cards.last.question
  #   assert_equal "Justin bieber" , generator.cards.last.answer
  #   assert_equal :PopCulture , generator.cards.last.category
  #   assert_equal 4, generator.cards.length
  #
  # end

end

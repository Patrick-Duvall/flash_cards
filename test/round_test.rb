require "minitest/autorun"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_has_a_deck

    assert_equal @deck,  @round.deck
  end

  def test_turns_starts_empty

    assert_equal [], @round.turns
  end

  def test_has_current_card

    assert_equal @card_1, @round.current_card
  end

  def test_can_take_turns

    @round.take_turn("Juneau")
    assert_equal @round.current_card, @card_2
    assert_equal 1, @round.turns.length
    @round.take_turn("Mars")
    assert_equal @round.current_card, @card_3
    assert_equal 2, @round.turns.length
    assert @round.turns.all?{|turn| turn.is_a?(Turn)}
  end




  def test_number_correct
    @round.take_turn("Juneau")
    assert_equal 1,  @round.number_correct
    @round.take_turn("Calgary")
    assert_equal 1,  @round.number_correct
    @round.take_turn("North north west")
    assert_equal 2,  @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 1,  @round.number_correct_by_category(:Geography)
    @round.take_turn("Calgary")
    assert_equal 0 , @round.number_correct_by_category(:STEM)
    @round.take_turn("North north west")
    assert_equal 1,  @round.number_correct_by_category(:STEM)
    assert_equal 0, @round.number_correct_by_category(:StarWars)

  end

  def test_percent_correct
    @round.take_turn("Juneau")
    assert_equal 100.0,  @round.percent_correct
    @round.take_turn("Calgary")
    assert_equal 50.0 , @round.percent_correct
    @round.take_turn("North north west")
    assert_equal 66.7,  @round.percent_correct
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 100.0,  @round.percent_correct_by_category(:Geography)
    @round.take_turn("Calgary")
    assert_equal 0 , @round.percent_correct_by_category(:STEM)
    @round.take_turn("North north west")
    assert_equal 50.0,  @round.percent_correct_by_category(:STEM)
  end


end

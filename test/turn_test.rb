require "minitest/autorun"
require "./lib/card"
require "./lib/turn"

class TurnTest < Minitest::Test

  def test_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Card, turn.card
  end

  def test_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
      assert_equal "Juneau", turn.guess
  end

  def test_returns_correct_when_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
    
      assert_equal true, turn.correct?
  end

  def test_returns_incorrect_when_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Lincoln", card)
      assert_equal false, turn.correct?
  end

  def test_returns_true_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
      assert_equal "Correct!", turn.feedback
  end

  def test_returns_false_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Lincoln", card)
      assert_equal "Incorrect!", turn.feedback
  end

end

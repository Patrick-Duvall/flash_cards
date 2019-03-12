class Turn
  attr_reader :guess, :card, :category
  def initialize(guess, card)
    @guess = guess
    @card = card
    @category = card.category
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    return "Correct!" if correct?
    return "Incorrect!" if !correct?
  end


end

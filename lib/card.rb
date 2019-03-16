class Card
  attr_reader :question, :answer, :category
  def initialize(question, answer, category)
    
    @question = question
    @answer = answer
    @category = category
  end

  def properties
    [@question, @answer, @category.to_s]
  end

end

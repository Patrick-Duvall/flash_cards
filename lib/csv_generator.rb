
class CSVGenerator
  attr_reader :cards
  def initialize(file)
    @file = File.open(file, "r")
     @cards = make_cards
  end

  def card_components
    lines = @file.map(&:chomp)
    lines.map{|line| line.split(',')}

  end

  def make_cards
    card_components.map do |elements|

      question = elements[0]
      answer = elements[1]
      category = elements[2].to_sym
      Card.new(question, answer, category)
    end

  end

end

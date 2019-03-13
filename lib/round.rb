class Round
attr_reader :turns, :deck
  def initialize(deck)
    @deck = deck
    @turns = []
    @top_card = 0
    @correct = 0
  end

  def start
    intro
    @deck.cards.each do |card|
      puts "This is card number #{@top_card + 1} out of #{@deck.cards.length}."
      puts "Question, #{current_card.question}"
      guess = gets.chomp.capitalize
      take_turn(guess)
      puts @turns.last.feedback
    end
    outro
  end

  def intro
    puts "Welcome, you're playing with #{@deck.cards.length} cards."
    puts '---------------------------------------------------------------'

  end

  def outro
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{@top_card} for a total score of #{percent_correct}%."
    @deck.categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}%"
    end
  end



  def take_turn(guess)
    @turns << Turn.new(guess, self.current_card)
    @top_card +=1
    @correct +=1 if @turns.last.correct?
  end

  def current_card
    @deck.cards[@top_card]
  end

  def number_correct
    @correct
  end

  def number_correct_by_category(category)
    turns_in_category(category).select{|turn| turn.correct? }.length
  end

  def percent_correct
    (number_correct.to_f * 100 / @top_card).round(1)
  end

  def turns_in_category(category)
    @turns.select{|turn| turn.card.category == category}
  end

  def percent_correct_by_category(category)
    numerator = number_correct_by_category(category).to_f * 100
    numerator / turns_in_category(category).length
  end
end

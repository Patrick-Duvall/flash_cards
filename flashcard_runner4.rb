require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"
require "./lib/csv_generator"

generator = CSVGenerator.new('./cards.txt')
cards = generator.cards
deck = Deck.new(cards)
round = Round.new(deck)

round.start


require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"
require "./lib/csv_generator"
require "./lib/api_generator"
require "./lib/yaml_generator"
require "./lib/card_loader"
require "pry"
require "httparty"

loader = CardLoader.new('./files/cards.txt')
cards = loader.generator.cards
deck = Deck.new(cards)
round = Round.new(deck)

round.start

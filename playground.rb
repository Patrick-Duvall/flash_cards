require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"
require "./lib/csv_generator"
require "./lib/api_generator"
require "./lib/yaml_generator"
require "./lib/card_loader"
require "./lib/writer"
require "pry"
require "httparty"
require "minitest/autorun"

require "csv"
require "json"

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)

writer = Writer.new("txt", deck, "cards_5")

writer.write_csv

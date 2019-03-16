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


class WriterTest < Minitest::Test

def setup

  @deck = CardLoader.new("./files/cards.txt").generator.cards



end

def test_writes_csv
writer = Writer.new("csv", @deck, "cards_1.txt")
binding.pry
assert_equal "What is 5 + 5?,10,STEM\nWhat is Rachel's favorite animal?,red panda,Turing Staff\nWhat is Mike's middle name?,nobody knows,Turing Staff\nWhat cardboard cutout lives at Turing?,Justin bieber,PopCulture", writer.write_csv


end

end

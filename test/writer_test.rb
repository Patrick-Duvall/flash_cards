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
require "minitest/reporters"
require "csv"


class WriterTest < Minitest::Test

def setup

  @cards = CardLoader.new("./files/cards.txt").generator.cards
  @deck = Deck.new(@cards)
  @card_5 = Card.new("1+1","2",:STEM)



end
def test_writes_csv_function
  writer = Writer.new("csv", @deck, "cards.txt")
  binding.pry
  assert_equal "What is 5 + 5?,10,STEM\nWhat is Rachel's favorite animal?,red panda,Turing Staff\nWhat is Mike's middle name?,nobody knows,Turing Staff\nWhat cardboard cutout lives at Turing?,Justin bieber,PopCulture", writer.write_csv

end

def test_writes_yaml_function

  writer = Writer.new("yaml", @deck, "cards_1.yaml")
  assert_equal ({"cards"=>
  [{"question"=>"What is 5 + 5?", "answer"=>"10", "category"=>"STEM"},
   {"question"=>"What is Rachel's favorite animal?", "answer"=>"red panda", "category"=>"Turing Staff"},
   {"question"=>"What is Mike's middle name?", "answer"=>"nobody knows", "category"=>"Turing Staff"},
   {"question"=>"What cardboard cutout lives at Turing?", "answer"=>"Justin bieber", "category"=>"PopCulture"}]}), writer.write_yaml

end

  def test_writes_json_function

    writer = Writer.new("json", @deck, "cards_1.js")

    assert_equal ({"cards" =>[{"category"=>"STEM",
    "question"=>"What is 5 + 5?",
    "answer"=>"10"
    },{"category"=>"Turing Staff",
    "question"=>"What is Rachel's favorite animal?",
    "answer"=>"red panda"
    },{"category"=>"Turing Staff",
    "question"=>"What is Mike's middle name?",
    "answer"=>"nobody knows"
    },{"category"=>"PopCulture",
    "question"=>"What cardboard cutout lives at Turing?",
    "answer"=>"Justin bieber"
    }]}) , writer.write_json

  end

  def test_update_csv
    skip
    writer = Writer.new("csv", @deck, "cards")
    card = Card.new("2+2", "4", :STEM)
    writer.update_csv(card)
    assert_equal "What is 5 + 5?,10,STEM\nWhat is Rachel's favorite animal?,red panda,Turing Staff\nWhat is Mike's middle name?,nobody knows,Turing Staff\nWhat cardboard cutout lives at Turing?,Justin bieber,PopCulture\n2+2,4,STEM", IO.read("./files/cards.txt")
  end




end

require "minitest/autorun"
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

class CardLoaderTest < Minitest::Test

# def setup
#   @yaml = YAMLGenerator.new("./files.cards.yaml")
#   @api = APIGenerator.new
#   @csv =CSVGenerator.new("./files.cards.txt")
# end


def test_yaml

  loader = CardLoader.new("./files/cards.yaml")
    assert_instance_of YAMLGenerator, loader.generator
end

def test_csv

  loader = CardLoader.new("./files/cards.txt")
  assert_instance_of CSVGenerator, loader.generator

end

def test_api

  loader = CardLoader.new
    assert_instance_of APIGenerator, loader.generator

end

end

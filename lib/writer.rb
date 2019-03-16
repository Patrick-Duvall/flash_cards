
class Writer
  attr_reader :type, :deck
  def initialize(type, deck, filename)
    @deck = deck
    @type = type

  end

  def write_csv
    card_properties = @deck.map{|card|card.properties}
    card_properties.reduce(''){|new_string, el| new_string + el.join(',') + "\n"}.chomp

  end

  def write_yaml
    ret_hash = {"cards" => []}
    card_properties = @deck.map{|card|card.properties}
    card_properties.each do|array|
      yaml_card = {}
      yaml_card["question"] = array[0]
      yaml_card["answer"] = array[1]
      yaml_card["category"] = array[2].to_s
      ret_hash["cards"] << yaml_card
    end
    ret_hash
  end

  # def write_api
  #
  # end
  #




end

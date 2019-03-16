
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

  end

  # def write_api
  #
  # end
  #
  



end


class Writer
  attr_reader :type, :deck, :filename
  def initialize(type, deck, filename)
    @deck = deck
    @stupid_deck_saver = deck
    @type = type

    @filename = filename

  end


  def card_properties
    @deck.cards.map{|card|card.properties}

  end

  def write_csv

    card_properties.reduce(''){|new_string, el| new_string + el.join(',') + "\n"}.chomp

  end

  def write_yaml
    ret_hash = {"cards" => []}
    card_properties.each do|array|
      yaml_card = {}
      yaml_card["question"] = array[0]
      yaml_card["answer"] = array[1]
      yaml_card["category"] = array[2].to_s
      ret_hash["cards"] << yaml_card
    end
    ret_hash
  end

  def write_json
    ret_hash = {"cards" => []}
    card_properties.each do|array|
      yaml_card = {}
      yaml_card["question"] = array[0]
      yaml_card["answer"] = array[1]
      yaml_card["category"] = array[2].to_s
      ret_hash["cards"] << yaml_card
    end
    ret_hash
  end

  def write

    case @type
    when "csv"
      file = File.open("./files/#{@filename}.txt", 'w')
      file.puts(write_csv)
      file.close
    when "json"
      file = File.open("./files/#{@filename}.json", 'w')
      file.puts(JSON.generate(write_json))
      file.close
    when "yaml"
      file = File.open("./files/#{@filename}.yaml", 'w')
      file.puts(write_yaml.to_yaml)
      file.close

    end



  end

  def delete
    File.delete("./files/#{@filename}.#{@type}")
  end

  #Breaks principals OOP, BAD, but quicker than refactor, RAS

  def update_csv(card)
    @deck = Deck.new([card])
    text_to_add = write_csv
    file = File.open("./files/#{@filename}.txt", 'a+')
    file.puts(write_csv)
    file.close
    @deck = @stupid_deck_saver

  end

  def update_yaml(card)

  end






end

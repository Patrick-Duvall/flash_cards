require "yaml"
require "pry"

class YAMLGenerator
  attr_reader :file
  def initialize(file)
    @file = YAML.load_file(file)
    binding.pry
  end

  def card_info
     @file.values.flatten
  end

  def card_as_array
    card_info.map{|hash| hash.values}
  end

  def cards
      card_as_array.map do |elements|
      question = elements[0]
      answer = elements[1].to_s
      category = elements[2].to_sym
      Card.new(question, answer, category)
    end

  end


  # values = []
  #
  # questions.each do |hash|
  #   values << Card.new(hash["question"], hash["#{answer}"].to_s, hash["category"].to_sym)
  #   binding.pry
  # end
  # values

    # .map{|v| Card.new(v[0], v[1], v[2])}

  end



  # {"cards"=>
  #   [{"question"=>"What is 5 + 5?", "answer"=>10, "category"=>"STEM"},
  #    {"question"=>"What is Rachel's favorite animal?", "answer"=>"red panda", "category"=>"Turing Staff"},
  #    {"question"=>"What is Mike's middle name?", "answer"=>"nobody knows", "category"=>"Turing Staff"},
  #    {"question"=>"What cardboard cutout lives at Turing?", "answer"=>"Justin bieber", "category"=>"PopCulture"}]}


  #
  # def make_cards
  #   card_components.map do |elements|
  #
  #     question = elements[0]
  #     answer = elements[1]
  #     category = elements[2].to_sym
  #     Card.new(question, answer, category)
  #   end
  #
  # end


class APIGenerator
  attr_reader :response
  def initialize(num=5)
    @response = HTTParty.get("https://opentdb.com/api.php?amount=#{num.to_s}").parsed_response["results"]
    
  end

    def cards

      @response.map{|hash| Card.new(hash["question"], hash["correct_answer"] , hash["category"])}

  end




# response = HTTParty.get(url)
# response.parsed_response


  # def card_components
  #   lines = @file.map(&:chomp)
  #   lines.map{|line| line.split(',')}
  #
  # end
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

end

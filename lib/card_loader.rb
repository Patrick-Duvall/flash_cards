class CardLoader
  attr_reader :generator
  def initialize(file='')
    @generator = APIGenerator.new if file==''
    @generator = CSVGenerator.new(file) if file.match(/\.txt$/)
    @generator = YAMLGenerator.new(file) if file.match(/\.yaml$/)
  end




end

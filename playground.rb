require "pry"
require "httparty"

response = HTTParty.get('https://opentdb.com/api.php?amount=1')
p response.parsed_response

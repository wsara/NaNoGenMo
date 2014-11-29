require 'string-eater'

# class PersonTokenizer < StringEater::Tokenizer 
#   add_field :last_name 
#   look_for ", "
#   add_field :first_name, :extract => false
#   look_for " | "
#   add_field :street_address, :extract => false 
#   look_for ", " 
#   add_field :city
#   look_for ", " 
#   add_field :state 
#   look_for ", " 
# end

# tokenizer = PersonTokenizer.new
# string = "Flinstone, Fred | 301 Cobblestone Way, Bedrock, NA, 00000" 
# tokenizer.tokenize! string

# puts tokenizer.last_name
# puts tokenizer.city
# puts tokenizer.state

class QuoteTokenizer < StringEater::Tokenizer
	add_field :quote
	look_for "'"
end

quotes = QuoteTokenizer.new
string2 = "'I went to the store to get some puppies,' she said excitedly. 'There were so many!'"
tokenizer.tokenize! string2

puts tokenizer.quote
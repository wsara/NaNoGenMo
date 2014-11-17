test_string = '"I went to the store to get some puppies," she said excitedly. "There were so many!"'

puts test_string.gsub(/(["'])(?:(?=(\\?))\2.)*?\1/, '"PUPPIES PUPPIES PUPPIES"')
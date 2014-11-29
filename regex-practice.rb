require 'twitter'
load 'twitter_config.rb'

test_string = '"I went to the store to get some puppies," she said excitedly. "There were so many!"'

substring = test_string.slice(/(["'])(?:(?=(\\?))\2.)*?\1/)

def longest(string)
  string.split(" ").max_by(&:length)
end

search_term = longest(substring)

tweet = @client.search(search_term, result_type: "popular").first.text

#puts test_string.gsub(/(["'])(?:(?=(\\?))\2.)*?\1/, "\"#{tweet.delete("\n")}\"")

split_test = test_string.split(/(["'])(?:(?=(\\?))\2.)*?\1/)
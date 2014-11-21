require 'twitter'
load 'twitter_config.rb'

string = IO.read("wuthering-heights.txt")

heathcliff = @client.search("heathcliff", result_type: "popular").first.text


puts string.gsub(/(["'])(?:(?=(\\?))\2.)*?\1/, "'#{heathcliff}'")

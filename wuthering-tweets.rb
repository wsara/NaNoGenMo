require 'twitter'
load 'twitter_config.rb'

def find_tweet(substring)
	words = substring.split(" ").sort_by { |word| word.length }
	while words.empty? == false
		search_term = words.pop
		if search_term == "\"\""
			return ""
		end
		search_term.delete!("\n")
		sleep(0.01)
		tweet = @client.search(search_term, result_type: "popular").first
		if tweet.nil? == false
			puts "search term: " + search_term
			puts "tweet: " + tweet.text + "\n\n"
			return tweet.text
			break
		end
	end
	if words.empty?
		sleep(0.01)
		tweet = @client.search("twitter", result_type: "popular").first.text
		puts "tweet: " + tweet + "\n\n"
		return tweet
	end
end

string = IO.read("whales.txt")
re = /(["])(?:(?=(\\?))\2.)*?\1/m
final = ""
md = re.match(string)
last_bit = ""

loop do
	if md.nil?
		final += last_bit
		break
	else
		puts "match: " + md.to_s
		final += md.pre_match + '"' + find_tweet(md.to_s) + '"'
		last_bit = md.post_match
		md = re.match(md.post_match)
	end
end

puts "\n\n Final Result:"
puts final



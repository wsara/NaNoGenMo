require 'twitter'
require_relative '../twitter_config.rb'

def find_tweet(substring)
	words = substring.split(" ").sort_by { |word| word.length }
	while words.empty? == false
		search_term = words.pop
		if search_term == "\"\""
			return ""
		end
		search_term.delete!("\n")
		puts "going to sleep for 5 seconds"
		sleep(5)
		tweet = @client.search(search_term, lang: "en", result_type: "popular").first
		if tweet.nil? == false
			puts "search term: " + search_term
			puts "tweet: " + tweet.text + "\n\n"
			return tweet.text
			break
		end
	end
	if words.empty?
		sleep(5)
		puts "going to sleep for 5 seconds"
		tweet = @client.search("twitter", lang: "en", result_type: "popular").first.text
		puts "tweet: " + tweet + "\n\n"
		return tweet
	end
end

string = IO.read("../Input/moby-dick-complete.txt")
re = /(["])(?:(?=(\\?))\2.)*?\1/m
final = ""
md = re.match(string)
last_bit = ""
output = "../Output/output.txt"
puts "Running Wuthering Tweets at #{Time.now}"
puts "\n\n"

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

File.open(output, "w") do |file|
	file.puts "This novel was generated on #{Time.now} with Wuthering Tweets, by wsara"
	file.puts "Written for NaNoGenMo 2014. https://github.com/wsara/NaNoGenMo"
	file.puts "\n"
	file.puts final
end

puts "All done at #{Time.now}! Check #{output} for your novel."



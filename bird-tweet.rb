string = IO.read("wuthering-heights.txt")

puts string.gsub(/(["'])(?:(?=(\\?))\2.)*?\1/, "'tweets go here'")

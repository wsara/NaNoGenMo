# It takes a lot to make a stew
# A pinch of salt and laughter too
# A scoop of kids to add the spice
# A dash of love to make it nice
# And you've got...

# Too many cooks (x8)



stew = ["stew", "broth", "brew", "slurry"]
salt = ["salt", "cardamom", "smoked paprika", "skin flakes"]
laughter = ["laughter", "unbridled weeping", "solitary contemplation"]
kids = ["kids", "obligation", "crippling anxiety", "spiders"]
spice = ["spice", "ennui", "smell of burnt toast", "profound sense of loss"]
love = ["love", "grudging respect", "regret"]
cooks = "cooks"


puts "It takes a lot to make a #{stew.sample}"
puts "A pinch of #{salt.sample} and #{laughter.sample} too"
puts "A scoop of #{kids.sample} to add the #{spice.sample}"
puts "A dash of #{love.sample} to make it nice"
puts "And you've got..."
puts "\n"

8.times do
	puts "Too many #{cooks}"
end
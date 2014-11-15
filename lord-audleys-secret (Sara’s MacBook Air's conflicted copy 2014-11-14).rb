
string = "1. woman Woman 2. man Man 3. she She 4. he He 5. Lady lady 6. Lord lord 7. mother Mother 8. father Father"


puts "1. " + string

string.gsub!(/(\bwoman\b|\bman\b)/, "woman" => "man", "man" => "woman")
string.gsub!(/(\bWoman\b|\bMan\b)/, "Woman" => "Man", "Man" => "Woman")

puts "2. " + string

string.gsub!(/(\bshe\b|\bhe\b)/, "she" => "he", "he" => "she")
string.gsub!(/(\bShe\b|\bHe\b)/, "She" => "He", "He" => "She")

puts "3. " + string

string.gsub!(/(Lord|Lady)/, "Lady" => "Lord", "Lord" => "Lady")
string.gsub!(/(lord|lady)/, "lady" => "lord", "lord" => "lady")

puts "4. " + string

string.gsub!((/(mother|father)/i), "mother" => "father", "father" => "mother")
#string.gsub!(/(Mother|Father)/i, "Mother" => "Father", "Mother" => "Father")

puts "5. " + string


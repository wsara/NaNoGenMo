#string = IO.read("chapter7.txt")

string.gsub!(/(\bwoman\b|\bman\b)/, "woman" => "man", "man" => "woman")
string.gsub!(/(\bWoman\b|\bMan\b)/, "Woman" => "Man", "Man" => "Woman")

string.gsub!(/(\bshe\b|\bhe\b)/, "she" => "he", "he" => "she")
string.gsub!(/(\bShe\b|\bHe\b)/, "She" => "He", "He" => "She")

string.gsub!(/(\bLord\b|\bLady\b)/, "Lady" => "Lord", "Lord" => "Lady")
string.gsub!(/(\blord\b|\blady\b)/, "lady" => "lord", "lord" => "lady")

string.gsub!(/(\bmother\b|\bfather\b)/, "mother" => "father", "father" => "mother")
string.gsub!(/(\bMother\b|\bFather\b)/, "Mother" => "Father", "Father" => "Mother")

string.gsub!(/(\bhim\b|\bher\b|\bhis\b)/, "him" => "her", "her" => "him/his", "his" => "her/s")
string.gsub!(/(\bHim\b|\bHer\b|\bHis\b)/, "Him" => "Her", "Her" => "Him/His", "His" => "Her/s")

string.gsub!(/(\bhusband\b|\bwife\b)/, "husband" => "wife", "wife" => "husband")
string.gsub!(/(\bHusband\b|\bWife\b)/, "Husband" => "Wife", "Wife" => "Husband")

puts string

#to add: boy/girl, grandfather/mother, aunt/uncle, Mr./Mrs./Miss
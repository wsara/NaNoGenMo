1. Make a regular expression object that finds quotes
2. Valid quotes will have a space or newline character before the single quotation mark (nevermind)
3. Use re.match to find things in the string that match
4. Start building a new final string out of the MatchData object using the pre_match + to_s.gsub + post_match methods
5. Continue
6. Find some way of handling it when the match method returns nil instead of a MatchData object




[1] pry(main)> test_string = '"I went to the store to get some puppies," she said excitedly. "There were so many!"'
=> "\"I went to the store to get some puppies,\" she said excitedly. \"There were so many!\""
[2] pry(main)> test_string.split ('"')
=> ["", "I went to the store to get some puppies,", " she said excitedly. ", "There were so many!"]
[3] pry(main)> re = /AA/
=> /AA/
[4] pry(main)> re.match("the quick brown fox")
=> nil
[5] pry(main)> re.match("the quick brown fox is biting me AAAAAH!")
=> #<MatchData "AA">
[6] pry(main)> re.match("the quick brown fox is biting me AAAAAH!")
=> #<MatchData "AA">
[7] pry(main)> re.match("the quick brown fox is biting me AAAAAH!").length
=> 1
[8] pry(main)> re.match("the quick brown fox is biting me AAAAAH!")
=> #<MatchData "AA">
[9] pry(main)> re = /AA/g
SyntaxError: (eval):2: unknown regexp option - g
[9] pry(main)> re = /AA/
=> /AA/
[10] pry(main)> re.match("the quick brown fox is biting me AAAAAH!")
=> #<MatchData "AA">
[11] pry(main)> re.match("the quick brown fox is biting me AAAAAH!").inspect
=> "#<MatchData \"AA\">"
[12] pry(main)> re.match("the quick brown fox is biting me AAAAAH!").methods.sort
=> [:!,
 :!=,
 :!~,
 :<=>,
 :==,
 :===,
 :=~,
 :[],
 :__binding__,
 :__id__,
 :__send__,
 :begin,
 :captures,
 :class,
 :clone,
 :define_singleton_method,
 :display,
 :dup,
 :end,
 :enum_for,
 :eql?,
 :equal?,
 :extend,
 :freeze,
 :frozen?,
 :hash,
 :inspect,
 :instance_eval,
 :instance_exec,
 :instance_of?,
 :instance_variable_defined?,
 :instance_variable_get,
 :instance_variable_set,
 :instance_variables,
 :is_a?,
 :kind_of?,
 :length,
 :method,
 :methods,
 :names,
 :nil?,
 :object_id,
 :offset,
 :post_match,
 :pre_match,
 :pretty_inspect,
 :pretty_print,
 :pretty_print_cycle,
 :pretty_print_inspect,
 :pretty_print_instance_variables,
 :private_methods,
 :protected_methods,
 :pry,
 :public_method,
 :public_methods,
 :public_send,
 :regexp,
 :remove_instance_variable,
 :respond_to?,
 :send,
 :singleton_class,
 :singleton_method,
 :singleton_methods,
 :size,
 :string,
 :taint,
 :tainted?,
 :tap,
 :to_a,
 :to_enum,
 :to_s,
 :trust,
 :untaint,
 :untrust,
 :untrusted?,
 :values_at]
[13] pry(main)> re.match("the quick brown fox is biting me AAAAAH!").pre_match
=> "the quick brown fox is biting me "
[14] pry(main)> re.match("the quick brown fox is biting me AAAAAH!").post_match
=> "AAAH!"
[15] pry(main)> re = /A+/
=> /A+/
[16] pry(main)> re.match("the quick brown fox")
=> nil
[17] pry(main)> re.match("the quick brown fox is biting me AAAAAH!")
=> #<MatchData "AAAAA">
[18] pry(main)> md = re.match("the quick brown fox is biting me AAAAAH!")
=> #<MatchData "AAAAA">
[19] pry(main)> re
=> /A+/
[20] pry(main)> md.string
=> "the quick brown fox is biting me AAAAAH!"
[21] pry(main)> md.match
NoMethodError: undefined method `match' for #<MatchData "AAAAA">
from (pry):21:in `__pry__'
[22] pry(main)> md.matches
NoMethodError: undefined method `matches' for #<MatchData "AAAAA">
from (pry):22:in `__pry__'
[23] pry(main)> md.methods.sort.join(",")
=> "!,!=,!~,<=>,==,===,=~,[],__binding__,__id__,__send__,begin,captures,class,clone,define_singleton_method,display,dup,end,enum_for,eql?,equal?,extend,freeze,frozen?,hash,inspect,instance_eval,instance_exec,instance_of?,instance_variable_defined?,instance_variable_get,instance_variable_set,instance_variables,is_a?,kind_of?,length,method,methods,names,nil?,object_id,offset,post_match,pre_match,pretty_inspect,pretty_print,pretty_print_cycle,pretty_print_inspect,pretty_print_instance_variables,private_methods,protected_methods,pry,public_method,public_methods,public_send,regexp,remove_instance_variable,respond_to?,send,singleton_class,singleton_method,singleton_methods,size,string,taint,tainted?,tap,to_a,to_enum,to_s,trust,untaint,untrust,untrusted?,values_at"
[24] pry(main)> md.pretty_inspect
=> "#<MatchData \"AAAAA\">\n"
[25] pry(main)> print md.inspect
#<MatchData "AAAAA">=> nil
[26] pry(main)> print md.pretty_inspect
#<MatchData "AAAAA">
=> nil
[27] pry(main)> md.captures
=> []
[28] pry(main)> md.enum_for
=> #<Enumerator: ...>
[29] pry(main)> md.string
=> "the quick brown fox is biting me AAAAAH!"
[30] pry(main)> md.to_s
=> "AAAAA"
[31] pry(main)> md.values_at
=> []
[32] pry(main)> md.begin
ArgumentError: wrong number of arguments (0 for 1)
from (pry):32:in `begin'
[33] pry(main)> md.to_s
=> "AAAAA"
[34] pry(main)> md.pre_match + md.to_s + md.post_match
=> "the quick brown fox is biting me AAAAAH!"
[35] pry(main)> md.pre_match + md.to_s.gsub("A", "Z") + md.post_match
=> "the quick brown fox is biting me ZZZZZH!"
[36] pry(main)> md = re.match("The snake is AAAH cuddling me AAAH!")
=> #<MatchData "AAA">
[37] pry(main)> md = re.match("The snake is AAAH cuddling me AAAAAH!")
=> #<MatchData "AAA">
[38] pry(main)> final = ""
=> ""
[39] pry(main)> final += md.pre_match
=> "The snake is "
[40] pry(main)> final
=> "The snake is "
[41] pry(main)> final += md.to_s.gsub("A","Z")
=> "The snake is ZZZ"
[42] pry(main)> md = re.match(md.post_match)
=> #<MatchData "AAAAA">
[43] pry(main)> final += md.pre_match
=> "The snake is ZZZH cuddling me "
[44] pry(main)> final += md.to_s.gsub("A", "Z")
=> "The snake is ZZZH cuddling me ZZZZZ"
[45] pry(main)> md = re.match(md.post_match)
=> nil
[46] pry(main)> final += md.post_match
NoMethodError: undefined method `post_match' for nil:NilClass
from (pry):46:in `__pry__'
[47] pry(main)> sleep(7)
=> 7
[48] pry(main)> sleep(0.1)
=> 0
[49] pry(main)> text = "The snake is AAAAH cuddling me AAAAAAAH!"
=> "The snake is AAAAH cuddling me AAAAAAAH!"
[50] pry(main)> re.scan(text)
NoMethodError: undefined method `scan' for /A+/:Regexp
from (pry):50:in `__pry__'
[51] pry(main)> text.scan(re)
=> ["AAAA", "AAAAAAA"]
[52] pry(main)> text.sub("AAAA", "ZZZZ")
=> "The snake is ZZZZH cuddling me AAAAAAAH!"
[53] pry(main)> matches = re.scan(text)
NoMethodError: undefined method `scan' for /A+/:Regexp
from (pry):53:in `__pry__'
[54] pry(main)> matches = text.scan(re)
=> ["AAAA", "AAAAAAA"]
[55] pry(main)> text[2]
=> "e"
[56] pry(main)> text.index_of("snake")
NoMethodError: undefined method `index_of' for "The snake is AAAAH cuddling me AAAAAAAH!":String
from (pry):56:in `__pry__'
[57] pry(main)> text.index("snake")
=> 4
[58] pry(main)> text.index("AAAA")
=> 13
[59] pry(main)> text.sub!("AAAA", "the secret word is AAAAAAA")
=> "The snake is the secret word is AAAAAAAH cuddling me AAAAAAAH!"
[60] pry(main)> 
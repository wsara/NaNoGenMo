This repository contains my 2014 NaNoGenMo projects:

1-Meow prints "meow" 50,000 times.

2-Genderswap is me messing around with regular expressions to change swap gendered language, including, but not limited to, pronouns. It isn't very good! As my source text I was working with the classic sensation novel _Lady Audley's Secret_, which is quite good, but perhaps even better with the genders mixed up.

3-Wuthering-Tweets is my final project, which takes a sample text and replaces anything in double quotes (" ") with a semi-relevant tweet. I was originally planning to use Emily Brontë's _Wuthering Heights_ as my source text, but ran into some issues with its use of single quotes (' ') for character speech, which is indistinguishable from the apostrophe character in plain text. So, for now, I've switched to using _Moby Dick_ -- but you can run my _Wuthering Tweets_ program on anything you'd like! Just know that if your source text uses single quotes, it will be a little garbled.

A few notes: 

* I'm using sferik's excellent [twitter gem](https://github.com/sferik/twitter)
* You will also need to create a twitter config file; nizhu has a [very helpful guide](http://nizhu.github.io/ruby-intro-site/blog/2013/08/01/accessing-the-twitter-api/) on how to do so
* If you run the program as-is on a large source text you will run into rate limiting issues; replace the sleep(0.01) with sleep(5) (I have it set to 0.01 right now for debugging purposes)
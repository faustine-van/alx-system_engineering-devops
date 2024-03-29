# 0x06-regular_expressions

## Background Context
For this project, you have to build your regular expression using Oniguruma,
a regular expression library that which is used by Ruby by default.
Note that other regular expression libraries sometimes have different properties.

Because the focus of this exercise is to play with regular expressions (regex),
here is the Ruby code that you should use, just replace the regexp part,
meaning the code in between the //:

```sylvain@ubuntu$ cat example.rb
#!/usr/bin/env ruby
puts ARGV[0].scan(/127.0.0.[0-9]/).join
sylvain@ubuntu$
sylvain@ubuntu$ ./example.rb 127.0.0.2
127.0.0.2
sylvain@ubuntu$ ./example.rb 127.0.0.1
127.0.0.1
sylvain@ubuntu$ ./example.rb 127.0.0.a
```

## Resources
- Read or watch:

[Regular expressions - basics](https://www.slideshare.net/neha_jain/introducing-regular-expressions#1)
[Regular expressions - advanced](https://www.slideshare.net/neha_jain/advanced-regular-expressions-80296518)
[Rubular is your best friend](https://rubular.com/)
[Use a regular expression against a problem: now you have 2 problems](
https://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/)
[Learn Regular Expressions with simple, interactive exercises](https://regexone.com/)
[PHP/Javascript/Python](https://regex101.com/)
[http://www.regular-expressions.info/](http://www.regular-expressions.info/)
[http://www.w3schools.com/jsref/jsref_obj_regexp.asp Play withregexp (or compose them):](
http://www.w3schools.com/jsref/jsref_obj_regexp.asp Play with regexp (or compose them):)

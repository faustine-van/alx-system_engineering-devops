#!/usr/bin/env ruby


def extract_info(text)
	re_from = /\[from:(.*?)\]/
	re_to = /\[to:(.*?)\]/
	re_flags = /\[flags:(.*?)\]/

	f = text.scan(re_from)
  	t = text.scan(re_to)
  	fl = text.scan(re_flags)

  	from = f.flatten.join(", ")
  	to = t.flatten.join(", ")
  	flags = fl.flatten.join(", ")

  	puts "#{from}, " unless from.empty?
  	puts "#{to}, " unless to.empty?
  	puts "#{flags}" unless flags.empty?
end

text = ARGV[0]
extract_info(text)



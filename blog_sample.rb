#!/usr/local/bin/ruby
require 'erb'

# HTML読込
h = open("blog.html")
erb = ERB.new( h.read )

# HTML出力
print erb.result

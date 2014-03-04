#!/usr/local/bin/ruby

require "cgi"
require 'pg'
cgi = CGI.new
puts cgi.header("charset" => "UTF-8")

title = CGI.escapeHTML(cgi.params["t"].first)
main = CGI.escapeHTML(cgi.params["m"].first)

conn = PGconn.connect(dbname:'blog_system' ,user:'postgres')

post = conn.exec("select id from post;")
id = post.to_a.last['id'].to_i + 1

conn.exec("insert into post values ('#{title}', '#{main}', '#{id}');")

print <<EOM
<html>
<head>
<meta http-equiv="refresh" content="0 ; URL=comp.html">
<\head>
<\html>
EOM

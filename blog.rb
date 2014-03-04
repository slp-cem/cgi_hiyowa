#!/usr/local/bin/ruby
require 'cgi'
require 'pg'

conn = PGconn.connect(dbname:'blog_system' ,user:'postgres')

post = conn.exec("select * from post")
# comm = conn.exec("select * from comment")
# result = conn.exec("select id from post;")

cgi = CGI.new

puts cgi.header("charset" => "UTF-8")
print <<EOM
<html>
<body>
<input type="button" onclick="location.href='post.html'"value="新規投稿">
EOM

post.each do |record|
print <<EOM
<h1>#{record["title"]}</h1>
<p>#{record["main"]}</p>
<br>
EOM
end

print <<EOM
</body>
</html>
EOM

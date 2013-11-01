
require 'nokogiri'
require 'open-uri'

yahoostocknews = "http://ca.finance.yahoo.com/news/category-stocks/"

news = Nokogiri::HTML(open(yahoostocknews))

page_contents = news.css('.yom-top-story .bd .list-titlethumbsummary li')

File.open("yahoonews", "w") do |f|  
	f.puts("<!DOCTYPE HTML>")
	f.puts("<html>")
	f.puts("<head>")
	f.puts("	<title>StockNews</title>")
  	f.puts("</head>")
  	f.puts("<body>")
  	f.puts("	<h1>Market Movers</h1>")
  	f.puts("	<ul>")

  	page_contents.each do |article|
    	f.puts("	<li>" + article.text + "</li>")
    end

  f.puts("	</ul>")
  f.puts("</body>\n")
  f.puts("</html>\n")

end

require 'rubygems'
require 'nokogiri'
require 'open-uri'


nb_articles_visites = 0
page_debut = "https://fr.wikipedia.org/wiki/Sp%C3%A9cial:Page_au_hasard"
page = Nokogiri::HTML(open(page_debut))

liens = page.css("#mw-content-text > div > p > a")
page_a_visiter_incomplete = liens[0]["href"]	   
page_a_visiter = "https://fr.wikipedia.org#{page_a_visiter_incomplete}"
page2 = page_a_visiter





while page_a_visiter != "https://fr.wikipedia.org/wiki/Philosophie"
	nb_articles_visites += 1
	page = Nokogiri::HTML(open(page_a_visiter))
    liens = page.css("#mw-content-text > div > p > a")
    page_a_visiter_incomplete = liens[0]["href"]	   
    page_a_visiter = "https://fr.wikipedia.org#{page_a_visiter_incomplete}"
    puts page_a_visiter
end

puts "J'ai fini"
puts page2
puts nb_articles_visites



=begin
#mw-content-text > div > p:nth-child(4) > a:nth-child(4)
#mw-content-text > div > p:nth-child(3) > a:nth-child(4)
#mw-content-text > div > p:nth-child(2) > a:nth-child(2)
#mw-content-text > div > p:nth-child(2) > a
#mw-content-text > div > p:nth-child(2) > a
#mw-content-text > div > p:nth-child(4) > a:nth-child(1)

=end

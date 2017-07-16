require 'rubygems'
require 'nokogiri'
require 'open-uri'
require "pp"


def get_the_email_of_a_townhal_from_its_webpage(url_ville)
	page = Nokogiri::HTML(open(url_ville))
	email = page.css(".style27 .Style22")
	mailmairie = email[5].text
	return mailmairie
end



def get_all_the_urls_of_val_doise_townhalls()
	page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))

	nom_ville = Hash.new(0)

	tous_les_urls = page.css(".lientxt")
	tous_les_urls.each  { |element| 
		stock_url_incomplete = element['href']
		url_complete = "http://www.annuaire-des-mairies.com#{stock_url_incomplete}" # écrit l'url complète de chaque page de mairie avec le préfixe complet http://www. etc
		value = get_the_email_of_a_townhal_from_its_webpage(url_complete)
		nom_ville[element.text] = value
	}

	pp nom_ville

end


get_all_the_urls_of_val_doise_townhalls()



































=begin
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   




def get_all_the_urls_of_val_doise_townhalls
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	page.css(".lientxt").each do |element|
		puts element["href"]
	end

end



get_all_the_urls_of_val_doise_townhalls()



def get_the_email_of_a_townhal_from_its_webpage
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	email = page.css(".style27 .Style22")
	puts email[5].text
end



#get_the_email_of_a_townhal_from_its_webpage()
=end
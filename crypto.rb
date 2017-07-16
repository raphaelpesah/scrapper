require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'
  

def crypto
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	tableau = Hash.new
	compteur = -1


	tous_noms_monnaies = page.css("td.no-wrap.currency-name > a")
	toutes_valeurs_monnaies = page.css("td:nth-child(5) > a")



	tous_noms_monnaies.each do |element|
		compteur += 1
		key = element.text
		value = toutes_valeurs_monnaies[compteur].text
		tableau[key] = value
    end

    pp tableau
end

crypto()
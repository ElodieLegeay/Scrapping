require 'rubygems'

require 'nokogiri'

require 'open-uri'

def search_price

  pagemc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #connect a la page coinmarketcap

  listing = [] #créer un arret vide pour y inserrer les données

    pagemc.xpath("//a[@class=\"price\"]").each do |x| #cherche la balise avec la classe "price"

    listing << { name: x[:href].split("/")[2], price: x.text} #split les variables dans l'array pour le nom et pour le prix

  end

  return listing

end

  search_price.each do |name_price| #pour la fonction search_price créer une variable name_price et ensuite inscrit name_price qui vaut a l'association de "name" converti en string+

    puts name_price[:name].to_s + " (" + name_price[:price].to_s + ")" #price converti en string. afficher le nom et le prix

  end

#------------------------------

  #i = 1

=begin

#Loop to take the crypto rates every hours. I just put 10 seconds so you can see it working

#loop {

  search_price.each do |name_price|

    puts name_price[:name].to_s + " (" + name_price[:price].to_s + ")"

  end

#break}

=end

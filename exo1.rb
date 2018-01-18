require 'rubygems'
require 'nokogiri'
require 'open-uri'


#<====== Recupere L'adresse mail sur la page annuaire-des-mairies.com/95/vaureal.html ===>


#======== Va chercher les liens dans la balise ========

def get_all_the_urls_of_val_doise_townhalls


  page1 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))  #ouvre la page ciblée
  $get_llinks = page1.css('a[href*="95"]').map{|link| link["href"]} #definie un array "get_llinks" cible la balise avec href 95 et prend toutes les fin d'url


end




#-------Recupere l'adresse email à Partir d'un tableau -------

def get_the_email_of_a_townhal_from_its_webpage(get_llinks)
  get_llinks.each {|get_llinks|

  get_llinks[0]="" # on enelve le "." mais optionnel je pense ?


  page2 = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com"+get_llinks))


  puts link = page2.css('p:contains("@")').text} #mail
end


get_the_email_of_a_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls) #deux méthodes encastrées basé sur la variable generale $get_links

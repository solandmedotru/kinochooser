require 'mechanize'

agent = Mechanize.new()

chosen = false

until chosen
  page = agent.get("http://www.kinopoisk.ru/top/lists/1/filtr/all/sort/order/perpage/100/page/#{rand(5)}/")
  tr_tag = page.search("//tr[starts-with(@id, 'tr_')]").to_a.sample

  kino_title = tr_tag.search("a[@class='all']").text
  kinopoisk_rating = tr_tag.search("span[@class='all']").text
  kinopoisk_link = "http://www.kinopoisk.ru/film/#{tr_tag.attributes["id"]}/".delete("tr_")
  film_description = tr_tag.search("span[@class='gray_text']")[0].text

  puts kino_title
  puts film_description
  puts "Райтинг Кинопоиска: #{kinopoisk_rating}"
  puts "Подробнее тут: #{kinopoisk_link}"

  puts "Смотрим? (Y/N)"

  choise = gets.chomp.downcase

  if choise == "y"
    chosen = true
  end
end


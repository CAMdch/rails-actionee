# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning data base"
Company.destroy_all

amazon = Company.create!(name: 'Amazon', description: 'Amazon is an American e-commerce company based in Seattle. It is one of the giants of the Web, grouped under the acronym GAFAM9, alongside Google, Apple, Meta (formerly Facebook) and Microsoft. Created by Jeff Bezos in July 1994, the company was sold on the NASDAQ stock exchange in May 1997.', photo_url: 'https://startupecommerce.fr/wp-content/uploads/2018/08/devenir-vendeur-amazon-logo-scaled.jpg', headquarter_city: 'Seattle', web_site_url: 'https://www.amazon.fr/', symbol: 'AMZL')

tesla = Company.create!(name: 'Tesla', description: "Tesla Inc., called Tesla Motors until 2017, is an automaker of electric cars headquartered in Austin, Texas on the Colorado River in the United States. The name of the company is chosen in homage to Nikola Tesla, an American inventor and engineer of Serbian origin. It was founded in 2003 in San Carlos by Martin Eberhard and Marc Tarpenning. Elon Musk, its current leader, made it a manufacturer of innovative electric cars for the general public. Tesla's stated mission is to 'accelerate the global transition to a sustainable energy pattern', in particular by boosting the competitiveness of electric-powered automobiles. The brand is distinguished by the performance as well as by the on-board technologies of its vehicles, including its automatic piloting.", photo_url: 'https://cdn.1min30.com/wp-content/uploads/2019/06/Tesla-symbol.jpg', headquarter_city: 'Austin', web_site_url: 'https://www.tesla.com/fr_fr', symbol: 'TSL')

apple = Company.create!(name: 'Apple', description: "Apple (formerly Apple Computer) is an American multinational corporation that designs and markets consumer electronics, personal computers, and software. Among the company's best-known products are Macintosh computers, the iPod, iPhone and iPad, the Apple Watch, the iTunes media player or software for professionals such as Final Cut Pro and Pro Logic. In 2019, the company employs 137,000 employees and operates 506 Apple Stores in 25 countries and an online store where Apple devices and software are sold, but also from third parties. Its annual revenue for the year 2020 reached $111.4 billion.", photo_url: 'https://logos-marques.com/wp-content/uploads/2021/03/Apple-logo.png', headquarter_city: 'Cupertino', web_site_url: 'https://www.apple.com/fr/', symbol: 'APLE')

walmart = Company.create!(name: 'Walmart', description: "Walmart is an American transnational retail company founded by Sam Walton and today chaired by his eldest son, S. Robson Walton. Founded under this name in 1962, the company quickly developed in Arkansas, then dominated the whole country to begin to internationalize from 1991. In Europe, the stores are present in the United Kingdom under the sign Asda. Walmart is now attacking the Asian market. Established in China since 1996, the group employed around thirty thousand workers there in 20065 and more than 100,000 in 419 stores and 20 distribution centers in 2015. It is also present in Japan under the Seiyu brand. In 2005, 20 million customers visited Walmart stores on average each day.", photo_url: 'https://www.linformatique.org/wp-content/uploads/2021/04/walmart-logo.jpg', headquarter_city: 'Bentonville', web_site_url: 'https://www.walmart.com/', symbol: 'WLMT')

puts 'Finished !'

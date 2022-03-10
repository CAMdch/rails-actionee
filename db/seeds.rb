# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning data base"
Company.destroy_all
Stock.destroy_all
Publication.destroy_all
Review.destroy_all
User.destroy_all
Tag.destroy_all
Like.destroy_all

require "json"
require "open-uri"
require "time"

User.create!(email: 'camille@gmail.com', password: 'azerty', name: 'Camille Dauchy', admin: true)
User.create!(email: 'emily@gmail.com', password: 'azerty', name: 'Emily Haynes', admin: true)

amazon_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=amazon.com"
amazon_user_serialized = URI.open(amazon_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
amazon = JSON.parse(amazon_user_serialized)
amazon_company = Company.create!(name: amazon["name"], description: amazon["description"], photo_url: amazon["logo"], headquarter_city: amazon["geo"]["city"], web_site_url: amazon["url"], symbol: amazon["ticker"])
StockJob.perform_now(amazon_company.symbol)
NewsJob.perform_now(amazon_company.symbol)
RecommendationJob.perform_now(amazon_company.symbol)
puts 'Amazon done'

tesla_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=tesla.com"
tesla_user_serialized = URI.open(tesla_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
tesla = JSON.parse(tesla_user_serialized)
tesla_company = Company.create!(name: tesla["name"], description: tesla["description"], photo_url: tesla["logo"], headquarter_city: tesla["geo"]["city"], web_site_url: tesla["url"], symbol: tesla["ticker"])
StockJob.perform_now(tesla_company.symbol)
NewsJob.perform_now(tesla_company.symbol)
RecommendationJob.perform_now(tesla_company.symbol)
puts 'Tesla done'

apple_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=apple.com"
apple_user_serialized = URI.open(apple_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
apple = JSON.parse(apple_user_serialized)
apple_company = Company.create!(name: apple["name"], description: apple["description"], photo_url: apple["logo"], headquarter_city: apple["geo"]["city"], web_site_url: apple["url"], symbol: apple["ticker"])
StockJob.perform_now(apple_company.symbol)
NewsJob.perform_now(apple_company.symbol)
RecommendationJob.perform_now(apple_company.symbol)
puts 'Apple done'

walmart_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=walmart.com"
walmart_user_serialized = URI.open(walmart_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
walmart = JSON.parse(walmart_user_serialized)
walmart_company = Company.create!(name: walmart["name"], description: walmart["description"], photo_url: walmart["logo"], headquarter_city: walmart["geo"]["city"], web_site_url: walmart["url"], symbol: walmart["ticker"])
StockJob.perform_now(walmart_company.symbol)
NewsJob.perform_now(walmart_company.symbol)
RecommendationJob.perform_now(walmart_company.symbol)
puts 'Walmart done'

microsoft_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=microsoft.com"
microsoft_user_serialized = URI.open(microsoft_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
microsoft = JSON.parse(microsoft_user_serialized)
microsoft_company = Company.create!(name: microsoft["name"], description: microsoft["description"], photo_url: microsoft["logo"], headquarter_city: microsoft["geo"]["city"], web_site_url: microsoft["url"], symbol: microsoft["ticker"])
StockJob.perform_now(microsoft_company.symbol)
NewsJob.perform_now(microsoft_company.symbol)
RecommendationJob.perform_now(microsoft_company.symbol)
puts 'Microsoft done'

google_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=google.com"
google_user_serialized = URI.open(google_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
google = JSON.parse(google_user_serialized)
google_company = Company.create!(name: google["name"], description: google["description"], photo_url: google["logo"], headquarter_city: google["geo"]["city"], web_site_url: google["url"], symbol: "GOOGL")
StockJob.perform_now(google_company.symbol)
NewsJob.perform_now(google_company.symbol)
RecommendationJob.perform_now(google_company.symbol)
puts 'Google done'

nvidia_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=nvidia.com"
nvidia_user_serialized = URI.open(nvidia_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
nvidia = JSON.parse(nvidia_user_serialized)
nvidia_company = Company.create!(name: nvidia["name"], description: nvidia["description"], photo_url: nvidia["logo"], headquarter_city: nvidia["geo"]["city"], web_site_url: nvidia["url"], symbol: nvidia["ticker"])
StockJob.perform_now(nvidia_company.symbol)
NewsJob.perform_now(nvidia_company.symbol)
RecommendationJob.perform_now(nvidia_company.symbol)
puts 'Nvidia done'

meta_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=meta.com"
meta_user_serialized = URI.open(meta_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
meta = JSON.parse(meta_user_serialized)
meta_company = Company.create!(name: meta["name"], description: meta["description"], photo_url: meta["logo"], headquarter_city: meta["geo"]["city"], web_site_url: meta["url"], symbol: "FB")
StockJob.perform_now(meta_company.symbol)
NewsJob.perform_now(meta_company.symbol)
RecommendationJob.perform_now(meta_company.symbol)
puts 'Meta done'

visa_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=visa.com"
visa_user_serialized = URI.open(visa_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
visa = JSON.parse(visa_user_serialized)
visa_company = Company.create!(name: visa["name"], description: visa["description"], photo_url: visa["logo"], headquarter_city: visa["geo"]["city"], web_site_url: visa["url"], symbol: visa["ticker"])
StockJob.perform_now(visa_company.symbol)
NewsJob.perform_now(visa_company.symbol)
RecommendationJob.perform_now(visa_company.symbol)
puts 'Visa done'

unitedhealthgroup_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=unitedhealthgroup.com"
unitedhealthgroup_user_serialized = URI.open(unitedhealthgroup_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
unitedhealthgroup = JSON.parse(unitedhealthgroup_user_serialized)
unitedhealthgroup_company = Company.create!(name: unitedhealthgroup["name"], description: unitedhealthgroup["description"], photo_url: unitedhealthgroup["logo"], headquarter_city: unitedhealthgroup["geo"]["city"], web_site_url: unitedhealthgroup["url"], symbol: unitedhealthgroup["ticker"])
StockJob.perform_now(unitedhealthgroup_company.symbol)
NewsJob.perform_now(unitedhealthgroup_company.symbol)
RecommendationJob.perform_now(unitedhealthgroup_company.symbol)
puts 'United Health done'

jpmorganchase_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=jpmorganchase.com"
jpmorganchase_user_serialized = URI.open(jpmorganchase_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
jpmorganchase = JSON.parse(jpmorganchase_user_serialized)
jpmorganchase_company = Company.create!(name: jpmorganchase["name"], description: jpmorganchase["description"], photo_url: jpmorganchase["logo"], headquarter_city: jpmorganchase["geo"]["city"], web_site_url: jpmorganchase["url"], symbol: jpmorganchase["ticker"])
StockJob.perform_now(jpmorganchase_company.symbol)
NewsJob.perform_now(jpmorganchase_company.symbol)
RecommendationJob.perform_now(jpmorganchase_company.symbol)
puts 'Jpmorgan Chase done'

johnsonjohnson_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=johnsonjohnson.com"
johnsonjohnson_user_serialized = URI.open(johnsonjohnson_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
johnsonjohnson = JSON.parse(johnsonjohnson_user_serialized)
johnsonjohnson_company = Company.create!(name: johnsonjohnson["name"], description: johnsonjohnson["description"], photo_url: johnsonjohnson["logo"], headquarter_city: johnsonjohnson["geo"]["city"], web_site_url: johnsonjohnson["url"], symbol: johnsonjohnson["ticker"])
StockJob.perform_now(johnsonjohnson_company.symbol)
NewsJob.perform_now(johnsonjohnson_company.symbol)
RecommendationJob.perform_now(johnsonjohnson_company.symbol)
puts 'Johnsonjohnson done'

# pg_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=pg.com"
# pg_user_serialized = URI.open(pg_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
# pg = JSON.parse(pg_user_serialized)
# pg_company = Company.create!(name: pg["name"], description: pg["description"], photo_url: pg["logo"], headquarter_city: pg["geo"]["city"], web_site_url: pg["url"], symbol: "PG")
# StockJob.perform_now(pg_company.symbol)
# NewsJob.perform_now(pg_company.symbol)
# RecommendationJob.perform_now(pg_company.symbol)
# puts "PG done"

# mastercard_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=mastercard.com"
# mastercard_user_serialized = URI.open(mastercard_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
# mastercard = JSON.parse(mastercard_user_serialized)
# mastercard_company = Company.create!(name: mastercard["name"], description: mastercard["description"], photo_url: mastercard["logo"], headquarter_city: mastercard["geo"]["city"], web_site_url: mastercard["url"], symbol: "MA")
# StockJob.perform_now(mastercard_company.symbol)
# NewsJob.perform_now(mastercard_company.symbol)
# RecommendationJob.perform_now(mastercard_company.symbol)
# puts "mastercard done"

# bankofamerica_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=bankofamerica.com"
# bankofamerica_user_serialized = URI.open(bankofamerica_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
# bankofamerica = JSON.parse(bankofamerica_user_serialized)
# bankofamerica_company = Company.create!(name: bankofamerica["name"], description: bankofamerica["description"], photo_url: bankofamerica["logo"], headquarter_city: bankofamerica["geo"]["city"], web_site_url: bankofamerica["url"], symbol: bankofamerica["ticker"])
# StockJob.perform_now(bankofamerica_company.symbol)
# NewsJob.perform_now(bankofamerica_company.symbol)
# RecommendationJob.perform_now(bankofamerica_company.symbol)
# puts "bankofamerica done"

# homedepot_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=homedepot.com"
# homedepot_user_serialized = URI.open(homedepot_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
# homedepot = JSON.parse(homedepot_user_serialized)
# homedepot_company = Company.create!(name: homedepot["name"], description: homedepot["description"], photo_url: homedepot["logo"], headquarter_city: homedepot["geo"]["city"], web_site_url: homedepot["url"], symbol: homedepot["ticker"])
# StockJob.perform_now(homedepot_company.symbol)
# NewsJob.perform_now(homedepot_company.symbol)
# RecommendationJob.perform_now(homedepot_company.symbol)
# puts "homedepot done"

# exxonmobil_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=exxonmobil.com"
# exxonmobil_user_serialized = URI.open(exxonmobil_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
# exxonmobil = JSON.parse(exxonmobil_user_serialized)
# exxonmobil_company = Company.create!(name: exxonmobil["name"], description: exxonmobil["description"], photo_url: exxonmobil["logo"], headquarter_city: exxonmobil["geo"]["city"], web_site_url: exxonmobil["url"], symbol: exxonmobil["ticker"])
# StockJob.perform_now(exxonmobil_company.symbol)
# NewsJob.perform_now(exxonmobil_company.symbol)
# RecommendationJob.perform_now(exxonmobil_company.symbol)
# puts "exxonmobil done"

# chevron_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=chevron.com"
# chevron_user_serialized = URI.open(chevron_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
# chevron = JSON.parse(chevron_user_serialized)
# chevron_company = Company.create!(name: chevron["name"], description: chevron["description"], photo_url: chevron["logo"], headquarter_city: chevron["geo"]["city"], web_site_url: chevron["url"], symbol: chevron["ticker"])
# StockJob.perform_now(chevron_company.symbol)
# NewsJob.perform_now(chevron_company.symbol)
# RecommendationJob.perform_now(chevron_company.symbol)
# puts "chevron done"

# cocacola_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=cocacola.com"
# cocacola_user_serialized = URI.open(cocacola_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
# cocacola = JSON.parse(cocacola_user_serialized)
# cocacola_company = Company.create!(name: cocacola["name"], description: cocacola["description"], photo_url: cocacola["logo"], headquarter_city: cocacola["geo"]["city"], web_site_url: cocacola["url"], symbol: "KO")
# StockJob.perform_now(cocacola_company.symbol)
# NewsJob.perform_now(cocacola_company.symbol)
# RecommendationJob.perform_now(cocacola_company.symbol)
# puts "cocacola done"

# disney_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=disney.com"
# disney_user_serialized = URI.open(disney_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
# disney = JSON.parse(disney_user_serialized)
# disney_company = Company.create!(name: disney["name"], description: disney["description"], photo_url: disney["logo"], headquarter_city: disney["geo"]["city"], web_site_url: disney["url"], symbol: "DIS")
# StockJob.perform_now(disney_company.symbol)
# NewsJob.perform_now(disney_company.symbol)
# RecommendationJob.perform_now(disney_company.symbol)
# puts "disney done"

# pfizer = Company.create!(name: 'Pfizer', description: "Pfizer Inc. is an American multinational pharmaceutical and biotechnology corporation headquartered on 42nd Street in Manhattan, New York City. The company was established in 1849 in New York by two German immigrants, Charles Pfizer (1824–1906) and his cousin Charles F. Erhart (1821–1891). Pfizer develops and produces medicines and vaccines for immunology, oncology, cardiology, endocrinology, and neurology. The company has several blockbuster drugs or products that each generate more than US$1 billion in annual revenues. In 2020, 52% of the company's revenues came from the United States, 6% came from each of China and Japan, and 36% came from other countries.", photo_url: 'https://logos-marques.com/wp-content/uploads/2021/06/Pfizer_logo.png', headquarter_city: 'New York, New York', web_site_url: 'https://www.pfizer.com/', symbol: 'PFE')

# abbvie = Company.create!(name: 'AbbVie', description: "AbbVie is an American publicly traded biopharmaceutical company founded in 2013. It originated as a spin-off of Abbott Laboratories. As of December 2015, the company employed in excess of 28,000 globally, and provided products to individuals in more than 170 countries.", photo_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/AbbVie_logo.svg/2560px-AbbVie_logo.svg.png', headquarter_city: 'Lake Bluff, Illinois', web_site_url: 'https://www.abbvie.com/', symbol: 'ABBV')

# broadcoam = Company.create!(name: 'Broadcoam', description: "Broadcom Inc. is an American designer, developer, manufacturer and global supplier of a wide range of semiconductor and infrastructure software products. Broadcom's product offerings serve the data center, networking, software, broadband, wireless, and storage and industrial markets.", photo_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Broadcom_Ltd_Logo.svg/1280px-Broadcom_Ltd_Logo.svg.png', headquarter_city: 'San José, California', web_site_url: 'https://www.broadcom.com/', symbol: 'AVGO')

# eli_lilly = Company.create!(name: 'Eli Lilly', description: "Eli Lilly and Company is an American pharmaceutical company headquartered in Indianapolis, Indiana, with offices in 18 countries. Its products are sold in approximately 125 countries. The company was founded in 1876 by, and named after, Colonel Eli Lilly, a pharmaceutical chemist and veteran of the American Civil War. Lilly's notable achievements include being the first company to mass-produce the polio vaccine developed by Jonas Salk, and insulin. It was one of the first pharmaceutical companies to produce human insulin using recombinant DNA including Humulin (insulin medication), Humalog (insulin lispro), and the first approved biosimilar insulin product in the US, Basaglar (insulin glargine). Lilly is currently the largest manufacturer of psychiatric medications and produces Prozac (fluoxetine), Dolophine (methadone), Cymbalta (duloxetine), and Zyprexa (olanzapine).", photo_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Eli_Lilly_and_Company.svg/1200px-Eli_Lilly_and_Company.svg.png', headquarter_city: 'Indianapolis, Indiana', web_site_url: 'https://www.lilly.com/', symbol: 'LLY')

eco_friendly = Tag.create!(name: 'Eco Friendly')
gender_equality = Tag.create!(name: 'Gender Equality')
diversity_and_inclusion = Tag.create!(name: 'Diversity and Inclusion')
handicap_support = Tag.create!(name: 'Handicap Support')
fair_compensation = Tag.create!(name: 'Fair Compensation')
no_animal_cruelty = Tag.create!(name: 'Cruelty-free')

CompanyTag.create!(company: amazon_company, tag: fair_compensation)
CompanyTag.create!(company: amazon_company, tag: gender_equality)

CompanyTag.create!(company: apple_company, tag: eco_friendly)
CompanyTag.create!(company: apple_company, tag: handicap_support)
CompanyTag.create!(company: apple_company, tag: gender_equality)
CompanyTag.create!(company: apple_company, tag: diversity_and_inclusion)

CompanyTag.create!(company: tesla_company, tag: eco_friendly)
CompanyTag.create!(company: tesla_company, tag: no_animal_cruelty)
CompanyTag.create!(company: tesla_company, tag: handicap_support)

CompanyTag.create!(company: walmart_company, tag: diversity_and_inclusion)

CompanyTag.create!(company: microsoft_company, tag: diversity_and_inclusion)
CompanyTag.create!(company: microsoft_company, tag: no_animal_cruelty)
CompanyTag.create!(company: microsoft_company, tag: handicap_support)

CompanyTag.create!(company: google_company, tag: fair_compensation)
CompanyTag.create!(company: google_company, tag: no_animal_cruelty)
CompanyTag.create!(company: google_company, tag: diversity_and_inclusion)
CompanyTag.create!(company: google_company, tag: gender_equality)

CompanyTag.create!(company: nvidia_company, tag: diversity_and_inclusion)

CompanyTag.create!(company: meta_company, tag: no_animal_cruelty)
CompanyTag.create!(company: meta_company, tag: diversity_and_inclusion)
CompanyTag.create!(company: meta_company, tag: gender_equality)

CompanyTag.create!(company: visa_company, tag: no_animal_cruelty)

CompanyTag.create!(company: unitedhealthgroup_company, tag: no_animal_cruelty)
CompanyTag.create!(company: unitedhealthgroup_company, tag: handicap_support)

CompanyTag.create!(company: jpmorganchase_company, tag: fair_compensation)

CompanyTag.create!(company: johnsonjohnson_company, tag: diversity_and_inclusion)

# CompanyTag.create!(company: pg_company, tag: diversity_and_inclusion)

# CompanyTag.create!(company: mastercard_company, tag: no_animal_cruelty)
# CompanyTag.create!(company: mastercard_company, tag: eco_friendly)

# CompanyTag.create!(company: bankofamerica_company, tag: handicap_support)

# CompanyTag.create!(company: homedepot_company, tag: no_animal_cruelty)
# CompanyTag.create!(company: homedepot_company, tag: fair_compensation)

# CompanyTag.create!(company: cocacola_company, tag: no_animal_cruelty)
# CompanyTag.create!(company: cocacola_company, tag: diversity_and_inclusion)

# CompanyTag.create!(company: disney_company, tag: diversity_and_inclusion)
# CompanyTag.create!(company: disney_company, tag: gender_equality)

# CompanyTag.create!(company: pfizer, tag: fair_compensation)

# CompanyTag.create!(company: abbvie, tag: fair_compensation)
# CompanyTag.create!(company: abbvie, tag: handicap_support)

# CompanyTag.create!(company: broadcoam, tag: no_animal_cruelty)

# CompanyTag.create!(company: eli_lilly, tag: gender_equality)


photo_beth = URI.open('https://www.thelanguagecenter.fr/en/files/2019/11/Business-Woman-portrait-3.jpg')
beth = User.new(email: 'beth@gmail.com', password: 'azerty', name: 'Beth Galetti')
beth.photo.attach(io: photo_beth, filename: 'beth-image.jpg', content_type: 'image/jpg')
beth.save!

photo_lisa = URI.open('https://www.apple.com/leadership/images/bio/lisa_jackson_image.png.og.png?1644352889233')
lisa = User.new(email: 'lisa@gmail.com', password: 'azerty', name: 'Lisa Jackson')
lisa.photo.attach(io: photo_lisa, filename: 'lisa-image.jpg', content_type: 'image/jpg')
lisa.save!

photo_ellen = URI.open('http://magazine.blogs.wesleyan.edu/files/2019/09/ELLEN-WEST.jpg')
ellen = User.new(email: 'ellen@gmail.com', password: 'azerty', name: 'Ellen West')
ellen.photo.attach(io: photo_ellen, filename: 'ellen-image.jpg', content_type: 'image/jpg')
ellen.save!

photo_susan = URI.open('https://www.americanconsumernews.net/media/insiders/2058push_susantaylor.jpg')
susan = User.new(email: 'susan@gmail.com', password: 'azerty', name: 'Susan Taylor')
susan.photo.attach(io: photo_susan, filename: 'susan-image.jpg', content_type: 'image/jpg')
susan.save!

photo_kate = URI.open('https://www.sho.com/site/image-bin/images/1032076_3_0/1032076_3_0_prm-condolarashad_1024x640.jpg')
kate = User.new(email: 'kate@gmail.com', password: 'azerty', name: 'Kate Sacker')
kate.photo.attach(io: photo_kate, filename: 'kate-image.jpg', content_type: 'image/jpg')
kate.save!

photo_wendy = URI.open('https://tidibits.files.wordpress.com/2021/09/wendyrhoades6-1024x751-1.png')
wendy = User.new(email: 'wendy@gmail.com', password: 'azerty', name: 'Wendy Rhoades')
wendy.photo.attach(io: photo_wendy, filename: 'wendy-image.jpg', content_type: 'image/jpg')
wendy.save!

photo_warren = URI.open('https://img3.kurzy.cz/zpravy/obrazky/42/606042-warren-buffett-investuje-miliardy-do-techto-3-technologickych-akcii/Warren-Buffett-HD-Wallpaper-scaled.jpg')
warren = User.new(email: 'warren@gmail.com', password: 'azerty', name: 'Warren Buffet')
warren.photo.attach(io: photo_warren, filename: 'warren-image.jpg', content_type: 'image/jpg')
warren.save!

photo_mike = URI.open('https://thecinemaholic.com/wp-content/uploads/2022/01/billions-jhydr.jpg')
mike = User.new(email: 'mike@gmail.com', password: 'azerty', name: 'Mike Prince')
mike.photo.attach(io: photo_mike, filename: 'mike-image.jpg', content_type: 'image/jpg')
mike.save!

photo_taylor = URI.open('https://media.istockphoto.com/photos/portrait-of-a-confident-young-businessman-working-in-a-modern-office-picture-id1315205465?b=1&k=20&m=1315205465&s=170667a&w=0&h=NpuWnCZm03XM9igG68Er27J2hQnpLv80A4u6uRBjdkA=')
taylor = User.new(email: 'taylor@gmail.com', password: 'azerty', name: 'Taylor Mason')
taylor.photo.attach(io: photo_taylor, filename: 'taylor-image.jpg', content_type: 'image/jpg')
taylor.save!

photo_bill = URI.open('https://d1e00ek4ebabms.cloudfront.net/production/c375c9f4-f6c1-4d67-b0ca-4d9cfcfde354.jpg')
bill = User.new(email: 'bill@gmail.com', password: 'azerty', name: 'Bill Ackman')
bill.photo.attach(io: photo_bill, filename: 'lisa-image.jpg', content_type: 'image/jpg')
bill.save!

photo_ben = URI.open('https://www.b4-business.com/wp-content/uploads/2021/04/Founder-of-Gymshark-Ben-Francis.jpg')
ben = User.new(email: 'ben@gmail.com', password: 'azerty', name: 'Ben Francis')
ben.photo.attach(io: photo_ben, filename: 'ben-image.jpg', content_type: 'image/jpg')
ben.save!

photo_adam = URI.open('https://static.timesofisrael.com/www/uploads/2019/10/AP_19267645664475-e1571257830548.jpg')
adam = User.new(email: 'adam@gmail.com', password: 'azerty', name: 'Adam Neumann')
adam.photo.attach(io: photo_adam, filename: 'adam-image.jpg', content_type: 'image/jpg')
adam.save!

photo_sam = URI.open('https://fr.techtribune.net/wp-content/uploads/2021/08/ftx-boss-sam-bankman-fried-says-the-crypto-world-must-act-more-responsibly-to-show-it-doesnt-need-strict-regulation-as-he-hits-out-at-scammers-scaled.jpg')
sam = User.new(email: 'sam@gmail.com', password: 'azerty', name: 'Sam Bankman')
sam.photo.attach(io: photo_sam, filename: 'sam-image.jpg', content_type: 'image/jpg')
sam.save!


Review.create!(content: "Great stock to buy for the long term, check the article below https://www.cnbc.com/2022/03/06/top-wall-street-analysts-say-buy-stocks-like-apple-airbnb.html", user: warren , company: apple_company )
Review.create!(content: "Buy Apple stock if you want a great company that will benefit from the 5G upgrade cycle, check the article below https://www.fool.com/investing/2022/01/11/3-reasons-to-buy-apple-stock/#:~:text=Growing%20free%20cash%20flow%2C%20buybacks,returning%20it%20all%20to%20shareholders.", user: beth , company: apple_company )
Review.create!(content: "Apple just announced some new products, it could be a good time to buy the stock, check the article below https://www.fool.co.uk/2022/03/09/as-uncertainty-grows-id-buy-apple-shares-to-hold-for-a-decade/", user: ellen , company: apple_company )

Review.create!(content: "Best e-commerce company to invest in, check the article below https://money.usnews.com/investing/stock-market-news/slideshows/great-reasons-to-buy-amazon-stock", user: beth , company: amazon_company )
Review.create!(content: "Great company with still insane growth ahead, check the article below https://www.investors.com/news/technology/amazon-stock-buy-now/", user: warren , company: amazon_company )
Review.create!(content: "Amazon just anounced a 20:1 stock split, it could be a good time to buy, check the article below https://www.fool.com/investing/2022/02/26/why-now-may-be-the-perfect-time-to-buy-amazon/", user: lisa , company: amazon_company )

Review.create!(content: "This company has the best CEO, definetely a BUY, check the article below https://www.tipranks.com/news/blurbs/new-buy-rating-for-tesla-tsla-the-technology-giant-2", user: adam , company: tesla_company )
Review.create!(content: "With Tesla opening its giga factory in Berlin,the growth next year will be insane, in my opinion it is time to buy the stock, check the article below https://www.fool.com/investing/2022/02/09/is-tesla-stock-a-buy/", user: lisa , company: tesla_company )
Review.create!(content: "Tesla will grow more than 50% next year, that's why I am buying Tesla stock, check the article below https://finance.yahoo.com/m/375a8d89-934c-37a7-af03-cbbb73c1ca3a/3-meme-stocks-that-are.html", user: kate , company: tesla_company )

Review.create!(content: "Safe bet during riskier times, check the article below https://seekingalpha.com/article/4493240-walmart-stock-omnichannel-solid-long-term-growth-pillar", user: lisa , company: walmart_company )
Review.create!(content: "One of the best blue chip stock, check the article below https://www.nasdaq.com/articles/why-walmart-wmt-is-a-top-stock-for-the-long-term", user: adam , company: walmart_company )
Review.create!(content: "Good News, Walmart is increasing its dividend, check the article below https://finance.yahoo.com/news/walmart-nyse-wmt-paying-larger-111716579.html", user: wendy , company: walmart_company )

Review.create!(content: "Good Tech company, with a strong management team, check the article below https://seekingalpha.com/article/4490707-microsoft-stock-overvalued-undervalued", user: ben , company: microsoft_company )
Review.create!(content: "Company with some great products, it just made a significant acquisition wich can have positive impact on their stock, check the article below https://www.barrons.com/articles/microsoft-msft-stock-strong-buy-earnings-growth-51644332954", user: ellen , company: microsoft_company )
Review.create!(content: "If you want to buy Microsoft stock you should check the article below https://seekingalpha.com/article/4493384-apple-vs-microsoft-stock-better-buy", user: bill , company: microsoft_company )

Review.create!(content: "My favourite stock, Google is expected to grow 18% next year, check the article below https://www.investors.com/news/technology/google-stock-buy-now/", user: ellen , company: google_company )
Review.create!(content: "Google just made a major acquisition, it might be time to buy the stock, check the article below https://www.cnet.com/news/google-to-buy-cybersecurity-company-mandiant-for-about-5-4-billion/", user: ben , company: google_company )
Review.create!(content: "In my opinion you should buy this great growth stock now, check the article below https://www.fool.com/investing/2022/02/12/buy-alphabet-stock-now-or-after-stock-split/", user: susan , company: google_company )

Review.create!(content: "I am selling the stock as I prefer mastercard, check the article below https://www.investing.com/analysis/1-stock-to-buy-1-to-dump-when-markets-open-exxon-mobil-visa-200619379", user: bill , company: visa_company )
Review.create!(content: "I am buying the stock, It still has so more potential in my opinion, check the article below https://seekingalpha.com/article/4486242-visa-stock-buy-sell-recent-earnings", user: wendy , company: visa_company )
Review.create!(content: "This stock is so undervalued, you should definetly buy it, check the article below https://www.fool.com/investing/2022/03/01/hey-growth-investors-heres-a-value-stock-you-might/", user: kate , company: visa_company )

Review.create!(content: "Best semiconductor stock to buy right now, check the article below https://www.barrons.com/articles/nvidia-stock-51644345326", user: wendy, company: nvidia_company )
Review.create!(content: "One of the best stock to buy right now and It has a great profit margin, check the article below https://www.fool.com/investing/2022/03/03/why-today-could-be-the-best-time-to-buy-nvidias-st/", user: bill, company: nvidia_company )
Review.create!(content: "If you are interested in Nvidia stock you should check the article below https://www.fool.com/investing/2022/03/06/nvidia-is-crushing-records-so-why-is-its-stock-dow/", user: ben, company: nvidia_company )

Review.create!(content: "If you use their products you have to invest, check the article below https://www.barrons.com/articles/meta-stock-facebook-buy-sell-51644868760", user: kate , company: meta_company )
Review.create!(content: "Invest in Meta if you believe in the meataverse, check the article below https://www.fool.com/investing/2022/03/07/will-meta-platforms-be-a-trillion-dollar-stock-by/", user: susan , company: meta_company )
Review.create!(content: "Facebook has a great business, however, I did not buy the stock, check why in the article below https://markets.businessinsider.com/news/stocks/warren-buffett-berkshire-hathaway-facebook-meta-stock-charlie-munger-privacy-2022-2", user: warren , company: meta_company )

Review.create!(content: "I am buying this healthcare stock and insiders are also buying, check the article below https://www.barrons.com/articles/unitedhealth-stock-buy-51646174580", user: susan , company: unitedhealthgroup_company )
Review.create!(content: "Great American company that will overcome inflation easily , check the article below https://www.fool.com/investing/2022/02/10/if-you-invested-5000-in-unitedhealth-10-years-ago/", user: kate , company: unitedhealthgroup_company )
Review.create!(content: "I am personally buying this stock, read the article below to know why https://finance.yahoo.com/news/unitedhealth-group-inc-unh-good-214618464.html", user: ben , company: unitedhealthgroup_company )

Review.create!(content: "Great investment against inflation, it even pays dividends, check the article below https://finance.yahoo.com/news/heres-why-johnson-johnson-jnj-140002428.html#:~:text=Meanwhile%2C%20J%26J%20has%20one%20of,value%20investors%20should%20take%20notice.", user: bill , company: johnsonjohnson_company)
Review.create!(content: "If you want a safe investment for the long term, you should invest in J&J, check the article below https://www.barrons.com/articles/buy-johnson-and-johnson-stock-pick-barrons-51640723370", user: wendy , company: johnsonjohnson_company)
Review.create!(content: "If you want to invest in Johnson & Johnson you should read the article below https://www.fool.com/investing/2022/01/20/will-johnson-johnson-be-a-better-buy-after-spinnin/", user: adam, company: johnsonjohnson_company)

Review.create!(content: "Biggest US bank with the best CEO in the finance industry, if you want a safe dividend play this stock is the one for you, check the article below https://www.fool.com/investing/2021/04/08/is-jpmorgan-chase-the-value-stock-for-you/#:~:text=Many%20consider%20JPMorgan%20Chase%20a,P%2FE%20for%20financial%20institutions.", user: wendy, company: jpmorganchase_company )
Review.create!(content: "If you want shares of a bank just buy JPMorgan stock, check the article below https://www.fool.com/investing/2022/02/10/if-you-invested-5000-in-unitedhealth-10-years-ago/ ", user: bill, company: jpmorganchase_company )
Review.create!(content: "JPMorgan is the perfect stock if you want to protect yourself against inflation, check the article below for more information https://seekingalpha.com/article/4479116-jp-morgan-good-bank-stock-buy-2022 ", user: susan, company: jpmorganchase_company )


puts "creating likes"
Review.all.each do |review|
  User.all.each do |user|
    Like.create!(review:review, user:user, enjoyed:[true,false].sample)
  end
end

puts 'Finished !'

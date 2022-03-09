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

require "json"
require "open-uri"
require "time"

User.create!(email: 'camille@gmail.com', password: 'azerty', name: 'Camille Dauchy', admin: true)

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

# CompanyTag.create!(company: disnay_company, tag: diversity_and_inclusion)
# CompanyTag.create!(company: disnay_company, tag: gender_equality)

# CompanyTag.create!(company: pfizer, tag: fair_compensation)

# CompanyTag.create!(company: abbvie, tag: fair_compensation)
# CompanyTag.create!(company: abbvie, tag: handicap_support)

# CompanyTag.create!(company: broadcoam, tag: no_animal_cruelty)

# CompanyTag.create!(company: eli_lilly, tag: gender_equality)

puts 'Finished !'

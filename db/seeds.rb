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
puts 'Amazon done'

tesla_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=tesla.com"
tesla_user_serialized = URI.open(tesla_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
tesla = JSON.parse(tesla_user_serialized)
tesla_company = Company.create!(name: tesla["name"], description: tesla["description"], photo_url: tesla["logo"], headquarter_city: tesla["geo"]["city"], web_site_url: tesla["url"], symbol: tesla["ticker"])
StockJob.perform_now(tesla_company.symbol)
NewsJob.perform_now(tesla_company.symbol)
puts 'Tesla done'

apple_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=apple.com"
apple_user_serialized = URI.open(apple_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
apple = JSON.parse(apple_user_serialized)
apple_company = Company.create!(name: apple["name"], description: apple["description"], photo_url: apple["logo"], headquarter_city: apple["geo"]["city"], web_site_url: apple["url"], symbol: apple["ticker"])
StockJob.perform_now(apple_company.symbol)
NewsJob.perform_now(apple_company.symbol)
puts 'Apple done'

walmart_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=walmart.com"
walmart_user_serialized = URI.open(walmart_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
walmart = JSON.parse(walmart_user_serialized)
walmart_company = Company.create!(name: walmart["name"], description: walmart["description"], photo_url: walmart["logo"], headquarter_city: walmart["geo"]["city"], web_site_url: walmart["url"], symbol: walmart["ticker"])
StockJob.perform_now(walmart_company.symbol)
NewsJob.perform_now(walmart_company.symbol)
puts 'Walmart done'

microsoft_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=microsoft.com"
microsoft_user_serialized = URI.open(microsoft_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
microsoft = JSON.parse(microsoft_user_serialized)
microsoft_company = Company.create!(name: microsoft["name"], description: microsoft["description"], photo_url: microsoft["logo"], headquarter_city: microsoft["geo"]["city"], web_site_url: microsoft["url"], symbol: microsoft["ticker"])
StockJob.perform_now(microsoft_company.symbol)
NewsJob.perform_now(microsoft_company.symbol)
puts 'Microsoft done'

google_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=google.com"
google_user_serialized = URI.open(google_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
google = JSON.parse(google_user_serialized)
google_company = Company.create!(name: google["name"], description: google["description"], photo_url: google["logo"], headquarter_city: google["geo"]["city"], web_site_url: google["url"], symbol: "GOOGL")
StockJob.perform_now(google_company.symbol)
NewsJob.perform_now(google_company.symbol)
puts 'Google done'

berkshirehathaway_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=berkshirehathaway.com"
berkshirehathaway_user_serialized = URI.open(berkshirehathaway_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
berkshirehathaway = JSON.parse(berkshirehathaway_user_serialized)
berkshirehathaway_company = Company.create!(name: berkshirehathaway["name"], description: berkshirehathaway["description"], photo_url: berkshirehathaway["logo"], headquarter_city: berkshirehathaway["geo"]["city"], web_site_url: berkshirehathaway["url"], symbol: berkshirehathaway["ticker"])
StockJob.perform_now(berkshirehathaway_company.symbol)
NewsJob.perform_now(berkshirehathaway_company.symbol)
puts 'Berkshire Hathaway done'

nvidia_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=nvidia.com"
nvidia_user_serialized = URI.open(nvidia_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
nvidia = JSON.parse(nvidia_user_serialized)
nvidia_company = Company.create!(name: nvidia["name"], description: nvidia["description"], photo_url: nvidia["logo"], headquarter_city: nvidia["geo"]["city"], web_site_url: nvidia["url"], symbol: nvidia["ticker"])
StockJob.perform_now(nvidia_company.symbol)
NewsJob.perform_now(nvidia_company.symbol)
puts 'Nvidia done'

meta_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=meta.com"
meta_user_serialized = URI.open(meta_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
meta = JSON.parse(meta_user_serialized)
meta_company = Company.create!(name: meta["name"], description: meta["description"], photo_url: meta["logo"], headquarter_city: meta["geo"]["city"], web_site_url: meta["url"], symbol: "FB")
StockJob.perform_now(meta_company.symbol)
NewsJob.perform_now(meta_company.symbol)
puts 'Meta done'

visa_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=visa.com"
visa_user_serialized = URI.open(visa_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
visa = JSON.parse(visa_user_serialized)
visa_company = Company.create!(name: visa["name"], description: visa["description"], photo_url: visa["logo"], headquarter_city: visa["geo"]["city"], web_site_url: visa["url"], symbol: visa["ticker"])
StockJob.perform_now(visa_company.symbol)
NewsJob.perform_now(visa_company.symbol)
puts 'Visa done'

unitedhealthgroup_url = "https://company.bigpicture.io/v1/companies/find/stream?domain=unitedhealthgroup.com"
unitedhealthgroup_user_serialized = URI.open(unitedhealthgroup_url, 'Authorization' => '7JjxkIwoknXJ5iqc529c0o:383ivUPS7WL3ebjQ1tUd6r').read
unitedhealthgroup = JSON.parse(unitedhealthgroup_user_serialized)
unitedhealthgroup_company = Company.create!(name: unitedhealthgroup["name"], description: unitedhealthgroup["description"], photo_url: unitedhealthgroup["logo"], headquarter_city: unitedhealthgroup["geo"]["city"], web_site_url: unitedhealthgroup["url"], symbol: unitedhealthgroup["ticker"])
StockJob.perform_now(unitedhealthgroup_company.symbol)
NewsJob.perform_now(unitedhealthgroup_company.symbol)
puts 'United Health done'

# jpmorgan_chase = Company.create!(name: 'JPMorgan Chase', description: "JPMorgan Chase & Co. is an American multinational investment bank and financial services holding company headquartered in New York City. JPMorgan Chase is incorporated in Delaware. As of September 30, 2021, JPMorgan Chase is the largest bank in the United States, the world's largest bank by market capitalization, and the fifth-largest bank in the world in terms of total assets, with total assets of US$3.758 trillion.", photo_url:'https://logo-marque.com/wp-content/uploads/2021/02/JP-Morgan-Chase-Logo.png', headquarter_city: 'New York, New York', web_site_url: 'https://www.jpmorganchase.com/', symbol: 'JPM')

# johnson_johnson = Company.create!(name: 'Johnson & Johnson', description: "Johnson & Johnson (J&J) is an American multinational corporation founded in 1886 that develops medical devices, pharmaceuticals, and consumer packaged goods. Its common stock is a component of the Dow Jones Industrial Average and the company is ranked No. 36 on the 2021 Fortune 500 list of the largest United States corporations by total revenue. Johnson & Johnson is one of the world's most valuable companies, and is one of only two U.S.-based companies that has a prime credit rating of AAA, higher than that of the United States government.", photo_url: 'https://wwwfr.uni.lu/var/storage/images/media/images/lcl_images/johnson_johnson_logo/1265817-2-fre-FR/johnson_johnson_logo.png', headquarter_city: 'New Brunswick, New Jersey', web_site_url: 'https://www.jnj.com/healthcare-products', symbol:'JNJ')

# procter_gamble = Company.create!(name: 'Procter & Gamble', description: "The Procter & Gamble Company (P&G) is an American multinational consumer goods corporation headquartered in Cincinnati, Ohio, founded in 1837 by William Procter and James Gamble. It specializes in a wide range of personal health/consumer health, and personal care and hygiene products; these products are organized into several segments including Beauty; Grooming; Health Care; Fabric & Home Care; and Baby, Feminine, & Family Care. Before the sale of Pringles to Kellogg's, its product portfolio also included food, snacks, and beverages. P&G is incorporated in Ohio.", photo_url: 'https://upload.wikimedia.org/wikipedia/fr/d/d3/Procter_%26_Gamble_2013_%28logo%29.png', headquarter_city: 'Cincinnati, Ohio', web_site_url: 'https://fr.pg.com/', symbol: 'PG')

# mastercard = Company.create!(name: 'Mastercard', description: "Mastercard Inc. is an American multinational financial services corporation headquartered in the Mastercard International Global Headquarters in Purchase, New York. The Global Operations Headquarters is located in O'Fallon, Missouri, a municipality of St. Charles County, Missouri. Throughout the world, its principal business is to process payments between the banks of merchants and the card-issuing banks or credit unions of the purchasers who use the Mastercard brand debit, credit and prepaid cards to make purchases.", photo_url: 'https://logos-marques.com/wp-content/uploads/2021/07/Mastercard-logo.png', headquarter_city: 'Purchase, Harrison, New York', web_site_url: 'https://www.mastercard.fr/fr-fr.html', symbol: 'MA')

# bank_of_america = Company.create!(name: 'Bank Of America', description: "The Bank of America Corporation is an American multinational investment bank and financial services holding company headquartered in Charlotte, North Carolina. The bank was founded in San Francisco, and took its present form when NationsBank of Charlotte acquired it in 1998. It is the second largest banking institution in the United States, after JPMorgan Chase, and the eighth largest bank in the world. Bank of America is one of the Big Four banking institutions of the United States. It serves approximately 10.73% of all American bank deposits, in direct competition with JPMorgan Chase, Citigroup, and Wells Fargo. Its primary financial services revolve around commercial banking, wealth management, and investment banking.", photo_url: 'https://logos-marques.com/wp-content/uploads/2021/07/Bank-of-America-logo.png', headquarter_city: 'Charlotte, North Carolina', web_site_url: 'https://www.bankofamerica.com/', symbol:'BAC')

# home_depot = Company.create!(name: 'Home Depot', description: "The Home Depot, Inc., commonly known as Home Depot, is the largest home improvement retailer in the United States, supplying tools, construction products, appliances, and services. The company is headquartered in incorporated Cobb County, Georgia, with an Atlanta mailing address. It operates many big-box format stores across the United States ; all 10 provinces of Canada; and all 32 Mexican states and Mexico City. MRO company Interline Brands (now The Home Depot Pro) is also owned by The Home Depot, with 70 distribution centers across the United States.", photo_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/TheHomeDepot.svg/800px-TheHomeDepot.svg.png', headquarter_city: 'Atlanta, Georgia', web_site_url: 'https://ir.homedepot.com/', symbol: 'HD')

# exxon_mobil = Company.create!(name: 'Exxon Mobil', description: "Exxon Mobil Corporation, stylized as ExxonMobil, is an American multinational oil and gas corporation headquartered in Irving, Texas. It is the largest direct descendant of John D. Rockefeller's Standard Oil, and was formed on November 30, 1999, by the merger of Exxon (formerly the Standard Oil Company of New Jersey) and Mobil (formerly the Standard Oil Company of New York). ExxonMobil's primary brands are Exxon, Mobil, Esso, and ExxonMobil Chemical. ExxonMobil is incorporated in New Jersey.", photo_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Exxon_Mobil_Logo.svg/2560px-Exxon_Mobil_Logo.svg.png', headquarter_city: 'Irving,Texas', web_site_url:'https://corporate.exxonmobil.com/', symbol:'XOM')

# chevron = Company.create!(name: 'Chevron', description: "Chevron Corporation is an American multinational energy corporation. One of the successor companies of Standard Oil, it is headquartered in San Ramon, California, and active in more than 180 countries. Chevron is engaged in every aspect of the oil and natural gas industries, including hydrocarbon exploration and production; refining, marketing and transport; chemicals manufacturing and sales; and power generation. It was also one of the Seven Sisters that dominated the global petroleum industry from the mid-1940s to the 1970s.", photo_url: 'https://upload.wikimedia.org/wikipedia/fr/thumb/9/99/Chevron.svg/1200px-Chevron.svg.png', headquarter_city: 'San Ramon, California', web_site_url: 'https://www.chevron.com/', symbol: 'CVX')

# coca_cola = Company.create!(name: 'Coca Cola', description: "Coca-Cola, or Coke, is a carbonated soft drink manufactured by The Coca-Cola Company. Originally marketed as a temperance drink and intended as a patent medicine, it was invented in the late 19th century by John Stith Pemberton and was bought out by businessman Asa Griggs Candler, whose marketing tactics led Coca-Cola to its dominance of the world soft-drink market throughout the 20th century. The drink's name refers to two of its original ingredients: coca leaves, and kola nuts (a source of caffeine). The current formula of Coca-Cola remains a trade secret; however, a variety of reported recipes and experimental recreations have been published. The drink has inspired imitators and created a whole classification of soft drink: colas.", photo_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Coca-Cola_logo.svg/1024px-Coca-Cola_logo.svg.png', headquarter_city: 'Atlanta, Georgia', web_site_url: 'https://www.coca-cola.com/', symbol:'KO')

# walt_disney = Company.create!(name: 'The Walt Disney Company', description: "The Walt Disney Company, is an American multinational entertainment and media conglomerate headquartered at the Walt Disney Studios complex in Burbank, California. Disney was originally founded on October 16, 1923, by brothers Walt and Roy O. Disney as the Disney Brothers Cartoon Studio; it also operated under the names The Walt Disney Studio and Walt Disney Productions before officially changing its name to The Walt Disney Company in 1986. The company established itself as a leader in the American animation industry before diversifying into live-action film production, television, and theme parks. The company is known for its film studio division, The Walt Disney Studios, which includes Walt Disney Pictures, Walt Disney Animation Studios, Pixar, Marvel Studios, Lucasfilm, 20th Century Studios, 20th Century Animation, and Searchlight Pictures. Disney's other main business units include divisions in television, broadcasting, streaming media, theme park resorts, consumer products, publishing, and international operations. Through these various segments, Disney owns and operates the ABC broadcast network; cable television networks such as Disney Channel, ESPN, Freeform, FX, and National Geographic; publishing, merchandising, music, and theater divisions; direct-to-consumer streaming services such as Disney+, Star+, ESPN+, Hulu, and Hotstar; and Disney Parks, Experiences and Products, a group of 14 theme parks, resort hotels, and cruise lines around the world. Cartoon character Mickey Mouse, created in 1928 by Walt Disney and Ub Iwerks, serves as the company's mascot.", photo_url: 'https://logos-download.com/wp-content/uploads/2016/06/The_Walt_Disney_company_logo.png', headquarter_city: 'Burbank, California', web_site_url: 'https://thewaltdisneycompany.com/', symbol: 'DIS')

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

CompanyTag.create!(company: berkshirehathaway_company, tag: no_animal_cruelty)
CompanyTag.create!(company: berkshirehathaway_company, tag: fair_compensation)

CompanyTag.create!(company: nvidia_company, tag: diversity_and_inclusion)

CompanyTag.create!(company: meta_company, tag: no_animal_cruelty)
CompanyTag.create!(company: meta_company, tag: diversity_and_inclusion)
CompanyTag.create!(company: meta_company, tag: gender_equality)

CompanyTag.create!(company: visa_company, tag: no_animal_cruelty)

CompanyTag.create!(company: unitedhealthgroup_company, tag: no_animal_cruelty)
CompanyTag.create!(company: unitedhealthgroup_company, tag: handicap_support)

# CompanyTag.create!(company: jpmorgan_chase, tag: fair_compensation)

# CompanyTag.create!(company: johnson_johnson, tag: diversity_and_inclusion)

# CompanyTag.create!(company: procter_gamble, tag: diversity_and_inclusion)

# CompanyTag.create!(company: mastercard, tag: no_animal_cruelty)
# CompanyTag.create!(company: mastercard, tag: eco_friendly)

# CompanyTag.create!(company: bank_of_america, tag: handicap_support)

# CompanyTag.create!(company: home_depot, tag: no_animal_cruelty)
# CompanyTag.create!(company: home_depot, tag: fair_compensation)

# CompanyTag.create!(company: coca_cola, tag: no_animal_cruelty)
# CompanyTag.create!(company: coca_cola, tag: diversity_and_inclusion)

# CompanyTag.create!(company: walt_disney, tag: diversity_and_inclusion)
# CompanyTag.create!(company: walt_disney, tag: gender_equality)

# CompanyTag.create!(company: pfizer, tag: fair_compensation)

# CompanyTag.create!(company: abbvie, tag: fair_compensation)
# CompanyTag.create!(company: abbvie, tag: handicap_support)

# CompanyTag.create!(company: broadcoam, tag: no_animal_cruelty)

# CompanyTag.create!(company: eli_lilly, tag: gender_equality)

puts 'Finished !'

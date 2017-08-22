require 'json'
require 'nokogiri'
require 'open-uri'

# namespace :admin do
	
  desc "Update shop dashboard on demand"
  task update_shop: :environment do
		carousel = []
		newbie = []
		other = []

		doc = Nokogiri::HTML(open('https://apps.shopify.com/'))

		# Select information for carousel 
		doc.css('.resourcescontent').css('.slideshow').css('.slideshow-selectors').css('li').each_with_index do |item, index|
			title = item.css('a')[0]['data-track-click'].split('label')[1].slice(3..-3)
			link = item.css('a')[0]['href']
			carousel.push(Hash["id", index+1, "title", title, "link", link])
		end

		# Select info for new section
		doc.css('.resourcescontent').css('.feature-group')[0].css('.app-icon-grid').css('li').each_with_index do |item, index|
			title = item.css('a')[0]['data-track-click'].split('label')[1].slice(3..-3)
			link = item.css('a')[0]['href']
			newbie.push(Hash["id", index+1, "title", title, "link", link])
		end


		# # Select info for others section
		for i in 1..11
			sec_titl = doc.css('.resourcescontent').css('.feature-group')[i].css('.col4').css('h2').text
			doc.css('.resourcescontent').css('.feature-group')[i].css('.descriptive-app-group-grid').css('li').each_with_index do |item, index|
					title = item.css('a')[0]['data-track-click'].split('label')[1].slice(3..-3)
					link = item.css('a')[0]['href']
					other.push(Hash["section_title", sec_titl, "id", index+1, "title", title, "link", link])
				end
		end

			Dashboard.create!(
				carousel_info: JSON.pretty_generate(carousel),
				newbie: JSON.pretty_generate(newbie),
				others: JSON.pretty_generate(other)
				)
  end

# end

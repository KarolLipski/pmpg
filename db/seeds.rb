# encoding: UTF-8
require 'factory_girl_rails'
require 'faker'

#independent - dictionaries

# Title frequencies
freq = ['Dziennik', 'Tygodnik', 'Dwutygodnik', 'Miesięcznik', 'Dwumiesięcznik',
'Kwartalnik', 'Półrocznik', 'Rocznik', 'Wydanie jednorazowe']
@title_frequencies = []
freq.each do |type|
  @title_frequencies.push FactoryGirl.create(:title_frequency, name: type)
end

##########################################################################

# Publishers
@publishers = FactoryGirl.create_list(:publisher_full, 5)

# titles 
@titles = []
@publishers.each do |publisher|
  @titles.push FactoryGirl.create(:title, title_frequency:
    @title_frequencies[rand(9)], :publisher => publisher, title: "title #{rand(200)}")
  @titles.push FactoryGirl.create(:title, title_frequency:
    @title_frequencies[rand(9)], :publisher => publisher, 
    title: "title archival #{rand(200)}", archive: true)
end

# Sell points
@chains = FactoryGirl.create_list(:chain_full, 5)
@sell_points_without_chain = FactoryGirl.create_list(:sell_point_full, 5 , chain: nil)
@chains.each do |chain|
  @sell_points_chained = FactoryGirl.create_list(:sell_point_full, 1, chain: chain)
end
@all_sell_points = @sell_points_without_chain.concat(@sell_points_chained)

#Sell Points Offers
offer_names = %w[Standard Uroda Moto Dom Sport]
offer_names.each do |name|
  @offer = FactoryGirl.create(:offer, name: name)
  3.times do
    @offer.offer_titles.create(title: @titles[rand(@titles.size)], quantity: rand(12) )
    @offer.save
  end 
end

#Publisher offers (packages)
package_names = %w[Restauracje SPA Hotele Galerie Muzea]
package_names.each do |package|
  @package = FactoryGirl.create(:package, name: package)
  4.times do
    @package.sell_points << @all_sell_points[rand(@all_sell_points.size)]
    @package.save
  end
end

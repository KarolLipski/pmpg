# encoding: UTF-8
require 'factory_girl_rails'
require 'faker'

# Publishers
FactoryGirl.create_list(:publisher_full, 5)
# Issue frequencies
freq = ['Dziennik', 'Tygodnik', 'Dwutygodnik', 'Miesięcznik', 'Dwumiesięcznik',
'Kwartalnik', 'Półrocznik', 'Rocznik', 'Wydanie jednorazowe']
freq.each do |type|
  FactoryGirl.create(:issue_frequency, name: type)
end
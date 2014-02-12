# encoding: UTF-8
require 'factory_girl_rails'
require 'faker'

#independent - dictionaries

# Issue frequencies
freq = ['Dziennik', 'Tygodnik', 'Dwutygodnik', 'Miesięcznik', 'Dwumiesięcznik',
'Kwartalnik', 'Półrocznik', 'Rocznik', 'Wydanie jednorazowe']
@issue_frequencies = []
freq.each do |type|
  @issue_frequencies.push FactoryGirl.create(:issue_frequency, name: type)
end

##########################################################################

# Publishers
@publishers = FactoryGirl.create_list(:publisher_full, 5)

# issues 
@issues = []
@publishers.each do |publisher|
  @issues.push FactoryGirl.create(:issue, issue_frequency:
    @issue_frequencies[rand(9)], :publisher => publisher, title: "title #{rand(200)}")
  @issues.push FactoryGirl.create(:issue, issue_frequency:
    @issue_frequencies[rand(9)], :publisher => publisher, 
    title: "title archival #{rand(200)}", archive: true)
end
# == Schema Information
#
# Table name: title_frequencies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :title_frequency do
    name "dziennik"
  end
end

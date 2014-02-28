# == Schema Information
#
# Table name: contacts
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  phone            :string(255)
#  publisher_id     :integer
#  created_at       :datetime
#  updated_at       :datetime
#  contactable_id   :integer
#  contactable_type :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name {"#{Faker::Name.first_name} #{Faker::Name.last_name}"}
    email {Faker::Internet.email}
    phone {"#{rand(800)+100}-#{rand(800)+100}-#{rand(800)+100}"}
    association :contactable , factory: :publisher
  end
end

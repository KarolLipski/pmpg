# == Schema Information
#
# Table name: offers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    name {"Offer_#{rand(100)}"}
    description {"Offer Description #{rand(100)}"}
    price {"#{rand(100)+10}.#{rand(89)+10}"}
  end
end

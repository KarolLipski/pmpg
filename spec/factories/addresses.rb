# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  company_name     :string(255)
#  street           :string(255)
#  street_no        :integer
#  postal_code      :string(255)
#  city             :string(255)
#  nip              :string(255)
#  address_type     :string(255)
#  publisher_id     :integer
#  created_at       :datetime
#  updated_at       :datetime
#  addressable_id   :integer
#  addressable_type :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    company_name {Faker::Company.name}
    street {Faker::Address.street_name}
    street_no {Faker::Address.building_number}
    postal_code {"0#{rand(9)}-#{rand(600)+100}"}
    city {Faker::Address.city}
    nip {"#{rand(80)+100}-#{rand(80)+100}-#{rand(89)+10}-#{rand(89)+10}"}
    address_type "invoice"
    association :addressable, factory: :publisher
  end
end

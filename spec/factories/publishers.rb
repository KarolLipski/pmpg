# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher do
    name {Faker::Company.name}

    factory :publisher_full do
      after(:create) do |publisher, evaluator|
        FactoryGirl.create(:address,
          address_type: 'invoice', addressable: publisher)
        FactoryGirl.create(:address,
          address_type: 'correspond', nip: nil, addressable: publisher)
        FactoryGirl.create_list(:contact, 2, contactable: publisher)
      end
    end
  end
end

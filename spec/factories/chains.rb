# == Schema Information
#
# Table name: chains
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chain do
    name {Faker::Lorem.word}

    factory :chain_full do
      after(:create) do |chain, evaluator|
        FactoryGirl.create(:address,
          address_type: 'invoice', addressable: chain)
        FactoryGirl.create(:address,
          address_type: 'correspond', nip: nil, addressable: chain)
      end
    end
  end
end

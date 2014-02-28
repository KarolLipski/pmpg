# == Schema Information
#
# Table name: sell_points
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  chain_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sell_point do
    name {Faker::Company.name}
    association :chain, factory: :chain

    factory :sell_point_full do
      after(:create) do |sell_point, evaluator|
        FactoryGirl.create(:address,
          address_type: 'invoice', addressable: sell_point)
        FactoryGirl.create(:address,
          address_type: 'correspond', nip: nil, addressable: sell_point)
        FactoryGirl.create(:address,
          address_type: 'delivery', nip: nil, addressable: sell_point)
        FactoryGirl.create_list(:contact, 2, contactable: sell_point)
      end
    end
  end
end


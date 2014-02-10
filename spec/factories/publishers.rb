# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher do
    name {Faker::Company.name}

    factory :publisher_full do
      after(:create) do |publisher, evaluator|
        FactoryGirl.create(:publisher_address,
          address_type: 'invoice', publisher: publisher)
        FactoryGirl.create(:publisher_address,
          address_type: 'correspond', nip: nil, publisher: publisher)
        FactoryGirl.create_list(:publisher_contact, 2, publisher: publisher)
      end
    end
  end
end

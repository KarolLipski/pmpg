# == Schema Information
#
# Table name: sell_point_packages
#
#  id            :integer          not null, primary key
#  sell_point_id :integer
#  package_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sell_point_package do
    association :sell_point, factory: :sell_point
    association :package, factory: :package
  end
end

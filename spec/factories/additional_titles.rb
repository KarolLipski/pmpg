# == Schema Information
#
# Table name: additional_titles
#
#  id                  :integer          not null, primary key
#  sell_point_offer_id :integer
#  title_id            :integer
#  quantity            :integer
#  created_at          :datetime
#  updated_at          :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :additional_title do
    sell_point_offer nil
    title nil
    quantity 1
  end
end

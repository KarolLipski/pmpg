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

class SellPointPackage < ActiveRecord::Base
  belongs_to :sell_point
  belongs_to :package
end

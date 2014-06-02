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

require 'spec_helper'

describe AdditionalTitle do
  pending "add some examples to (or delete) #{__FILE__}"
end

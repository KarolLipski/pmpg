class AddNewColumnsToSellPointOffers < ActiveRecord::Migration
  
  class SellPointOffer < ActiveRecord::Base
  end

  def change
    add_column :sell_point_offers, :start_date, :date
    add_column :sell_point_offers, :end_date, :date
  end
end

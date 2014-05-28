class AddPriceToSellPointOffers < ActiveRecord::Migration
  def change
    add_column :sell_point_offers, :price, :decimal
  end
end

class CreateSellPointOffers < ActiveRecord::Migration
  def change
    create_table :sell_point_offers do |t|
      t.references :offer, index: true
      t.references :sell_point, index: true

      t.timestamps
    end
  end
end

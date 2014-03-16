class CreateOfferTitles < ActiveRecord::Migration
  def change
    create_table :offer_titles do |t|
      t.references :offer, index: true
      t.references :title, index: true

      t.timestamps
    end
  end
end

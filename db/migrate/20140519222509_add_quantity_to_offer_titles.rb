class AddQuantityToOfferTitles < ActiveRecord::Migration
  def change
    add_column :offer_titles, :quantity, :integer
  end
end

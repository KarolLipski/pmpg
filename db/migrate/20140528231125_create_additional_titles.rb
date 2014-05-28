class CreateAdditionalTitles < ActiveRecord::Migration
  def change
    create_table :additional_titles do |t|
      t.references :sell_point_offer
      t.references :title
      t.integer :quantity

      t.timestamps
    end
    add_index :additional_titles, :title_id , name: 'sell_point_offer_title'
    add_index :additional_titles, :sell_point_offer_id , name: 'sell_point_offer_offer_id'
  end
end

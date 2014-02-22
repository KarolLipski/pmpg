class CreateSellPoints < ActiveRecord::Migration
  def change
    create_table :sell_points do |t|
      t.string :name
      t.references :chain, index: true

      t.timestamps
    end
  end
end

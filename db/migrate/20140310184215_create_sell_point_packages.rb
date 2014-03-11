class CreateSellPointPackages < ActiveRecord::Migration
  def change
    create_table :sell_point_packages do |t|
      t.references :sell_point, index: true
      t.references :package, index: true

      t.timestamps
    end
  end
end

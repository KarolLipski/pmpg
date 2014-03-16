class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.references :title_frequency, index: true
      t.boolean :archive

      t.timestamps
    end
  end
end

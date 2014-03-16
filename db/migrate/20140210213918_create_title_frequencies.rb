class CreateTitleFrequencies < ActiveRecord::Migration
  def change
    create_table :title_frequencies do |t|
      t.string :name

      t.timestamps
    end
  end
end
